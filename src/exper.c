/* NetHack 3.7	exper.c	$NHDT-Date: 1621380393 2021/05/18 23:26:33 $  $NHDT-Branch: NetHack-3.7 $:$NHDT-Revision: 1.46 $ */
/* Copyright (c) Stichting Mathematisch Centrum, Amsterdam, 1985. */
/*-Copyright (c) Robert Patrick Rankin, 2007. */
/* NetHack may be freely redistributed.  See license for details. */

#include "hack.h"
#ifndef LONG_MAX
#include <limits.h>
#endif

static int enermod(int);
static void levelup_menu(void);
static void roleswitch_menu(void);

long
newuexp(lev)
int lev;
{
    /* keep this synced with the status-drawing code in the clients */
    switch (lev) {
    case  0: return      0;
    case  1: return     20; /* n^2 */
    case  2: return     40;
    case  3: return     80;
    case  4: return    160;
    case  5: return    320;
    case  6: return    640;
    case  7: return   1280;
    case  8: return   2560;
    case  9: return   5120;
    case 10: return  10000; /* triangle numbers */
    case 11: return  15000;
    case 12: return  21000;
    case 13: return  28000;
    case 14: return  36000;
    case 15: return  45000;
    case 16: return  55000;
    case 17: return  66000;
    case 18: return  81000; /* n*n series */
    case 19: return 100000;
    case 20: return 142000;
    case 21: return 188000;
    case 22: return 238000;
    case 23: return 292000;
    case 24: return 350000;
    case 25: return 412000;
    case 26: return 478000;
    case 27: return 548000;
    case 28: return 622000;
    case 29: return 700000;
    case 30: return 800000; /* 100k per additional !oGL */
    }
    impossible("unknown level: %d", lev);
    return 10000000;
}

static int
enermod(int en)
{
    switch (Role_switch) {
    case PM_CLERIC:
    case PM_WIZARD:
    case PM_CARTOMANCER:
        return (2 * en);
    case PM_HEALER:
    case PM_KNIGHT:
        return ((3 * en) / 2);
    case PM_BARBARIAN:
    case PM_VALKYRIE:
        return ((3 * en) / 4);
    default:
        return en;
    }
}

/* calculate spell power/energy points for new level */
int
newpw(void)
{
    int en = 0, enrnd, enfix;

    if (u.ulevel == 0) {
        en = g.urole.enadv.infix + g.urace.enadv.infix;
        if (g.urole.enadv.inrnd > 0)
            en += rnd(g.urole.enadv.inrnd);
        if (g.urace.enadv.inrnd > 0)
            en += rnd(g.urace.enadv.inrnd);
    } else {
        enrnd = (int) ACURR(A_WIS) / 2;
        if (u.ulevel < g.urole.xlev) {
            enrnd += g.urole.enadv.lornd + g.urace.enadv.lornd;
            enfix = g.urole.enadv.lofix + g.urace.enadv.lofix;
        } else {
            enrnd += g.urole.enadv.hirnd + g.urace.enadv.hirnd;
            enfix = g.urole.enadv.hifix + g.urace.enadv.hifix;
        }
        en = enermod(rn1(enrnd, enfix));
    }
    if (en <= 0)
        en = 1;
    if (u.ulevel < MAXULEV)
        u.ueninc[u.ulevel] = (xchar) en;
    return en;
}

/* return # of exp points for mtmp after nk killed */
int
experience(register struct monst *mtmp, register int nk)
{
    register struct permonst *ptr = mtmp->data;
    int i, tmp, tmp2;

    tmp = 1 + mtmp->m_lev * mtmp->m_lev;

    /*  For higher ac values, give extra experience */
    if ((i = find_mac(mtmp)) < 3)
        tmp += (7 - i) * ((i < 0) ? 2 : 1);

    /*  For very fast monsters, give extra experience */
    if (ptr->mmove > NORMAL_SPEED)
        tmp += (ptr->mmove > (3 * NORMAL_SPEED / 2)) ? 5 : 3;

    /*  For each "special" attack type give extra experience */
    for (i = 0; i < NATTK; i++) {
        tmp2 = ptr->mattk[i].aatyp;
        if (tmp2 > AT_BUTT) {
            if (tmp2 == AT_WEAP)
                tmp += 5;
            else if (tmp2 == AT_MAGC)
                tmp += 10;
            else
                tmp += 3;
        }
    }

    /*  For each "special" damage type give extra experience */
    for (i = 0; i < NATTK; i++) {
        tmp2 = ptr->mattk[i].adtyp;
        if (tmp2 > AD_PHYS && tmp2 < AD_BLND)
            tmp += 2 * mtmp->m_lev;
        else if ((tmp2 == AD_DRLI) || (tmp2 == AD_STON) || (tmp2 == AD_SLIM))
            tmp += 50;
        else if (tmp2 != AD_PHYS)
            tmp += mtmp->m_lev;
        /* extra heavy damage bonus */
        if ((int) (ptr->mattk[i].damd * ptr->mattk[i].damn) > 23)
            tmp += mtmp->m_lev;
        if (tmp2 == AD_WRAP && ptr->mlet == S_EEL && !Amphibious)
            tmp += 1000;
    }

    /*  For certain "extra nasty" monsters, give even more */
    if (extra_nasty(ptr))
        tmp += (7 * mtmp->m_lev);

    /* Templated monsters grant even more */
    if (has_etemplate(mtmp) && montemplates[ETEMPLATE(mtmp)->template_index].difficulty)
        tmp += (7 * mtmp->data->difficulty);

    /*  For higher level monsters, an additional bonus is given */
    if (mtmp->m_lev > 8)
        tmp += 50;

#ifdef MAIL_STRUCTURES
    /* Mail daemons put up no fight. */
    if (mtmp->data == &mons[PM_MAIL_DAEMON])
        tmp = 1;
#endif

    if (mtmp->mrevived || mtmp->mcloned) {
        /*
         *      Reduce experience awarded for repeated killings of
         *      "the same monster".  Kill count includes all of this
         *      monster's type which have been killed--including the
         *      current monster--regardless of how they were created.
         *        1.. 20        full experience
         *       21.. 40        xp / 2
         *       41.. 80        xp / 4
         *       81..120        xp / 8
         *      121..180        xp / 16
         *      181..240        xp / 32
         *      241..255+       xp / 64
         */
        for (i = 0, tmp2 = 20; nk > tmp2 && tmp > 1; ++i) {
            tmp = (tmp + 1) / 2;
            nk -= tmp2;
            if (i & 1)
                tmp2 += 20;
        }
    }

    return (tmp);
}

void
more_experienced(register int exper, register int rexp)
{
    long oldexp = u.uexp,
         oldrexp = u.urexp,
         newexp = oldexp + exper,
         rexpincr = 4 * exper + rexp,
         newrexp = oldrexp + rexpincr;

    /* cap experience and score on wraparound */
    if (newexp < 0 && exper > 0)
        newexp = LONG_MAX;
    if (newrexp < 0 && rexpincr > 0)
        newrexp = LONG_MAX;

    if (newexp != oldexp) {
        u.uexp = newexp;
        if (flags.showexp)
            g.context.botl = TRUE;
        /* even when experience points aren't being shown, experience level
           might be highlighted with a percentage highlight rule and that
           percentage depends upon experience points */
        if (!g.context.botl && exp_percent_changing())
            g.context.botl = TRUE;
    }
    /* newrexp will always differ from oldrexp unless they're LONG_MAX */
    if (newrexp != oldrexp) {
        u.urexp = newrexp;
#ifdef SCORE_ON_BOTL
        if (flags.showscore)
            g.context.botl = TRUE;
#endif
    }
    if (u.urexp >= (Role_if(PM_WIZARD) ? 1000 : 2000))
        flags.beginner = 0;
}

/* e.g., hit by drain life attack */
void
losexp(const char *drainer) /* cause of death, if drain should be fatal */
{
    register int num;
    int i, drained_role = -1;

    /* override life-drain resistance when handling an explicit
       wizard mode request to reduce level; never fatal though */
    if (drainer && !strcmp(drainer, "#levelchange"))
        drainer = 0;
    else if (resists_drli(&g.youmonst) || item_catches_drain(&g.youmonst))
        return;

    /* level-loss message; "Goodbye level 1." is fatal; divine anger
       (drainer==NULL) resets a level 1 character to 0 experience points
       without reducing level and that isn't fatal so suppress the message
       in that situation */
    if (u.ulevel > 1 || drainer)
        pline("%s level %d.", Goodbye(), u.ulevel);
    if (u.ulevel > 1) {
        u.ulevel -= 1;
        /* This bit of ugly code handles level drains that occur when a character
           has levels in a number of roles. Here's what happens:
           1. Try to drain the current role.
           2. If the current role is level one, drain a different role.
           3. If all roles are level one, then kill the character for daring to make
              things so complicated. */
        if (u.role_levels[flags.initrole] > 1) {
            u.role_levels[flags.initrole] -= 1;
            drained_role = flags.initrole;
        } else {
            for (i = 0; i < NUM_ROLES; i++) {
                if (u.role_levels[i] > 1) {
                    u.role_levels[i]--;
                    drained_role = i;
                    break;
                }
            }
            if (drained_role < 0 && drainer) {
                g.killer.format = KILLED_BY;
                if (g.killer.name != drainer)
                    Strcpy(g.killer.name, drainer);
                done(DIED);
                return;
            } else if (drained_role < 0) {
                done(DIED);
            }
        }
        /* remove intrinsic abilities */
        adjabil(u.ulevel + 1, u.ulevel, drained_role, u.role_levels[drained_role] + 1, u.role_levels[drained_role]);
    } else {
        if (drainer) {
            g.killer.format = KILLED_BY;
            if (g.killer.name != drainer)
                Strcpy(g.killer.name, drainer);
            done(DIED);
        }
        /* no drainer or lifesaved */
        u.uexp = 0;
    }
    num = (int) u.uhpinc[u.ulevel];
    u.uhpmax -= num;
    if (u.uhpmax < 1)
        u.uhpmax = 1;
    u.uhp -= num;
    if (u.uhp < 1)
        u.uhp = 1;
    else if (u.uhp > u.uhpmax)
        u.uhp = u.uhpmax;

    num = (int) u.ueninc[u.ulevel];
    u.uenmax -= num;
    if (u.uenmax < 0)
        u.uenmax = 0;
    u.uen -= num;
    if (u.uen < 0)
        u.uen = 0;
    else if (u.uen > u.uenmax)
        u.uen = u.uenmax;

    if (u.uexp > 0)
        u.uexp = newuexp(u.ulevel) - 1;

    if (Upolyd) {
        num = monhp_per_lvl(&g.youmonst);
        u.mhmax -= num;
        u.mh -= num;
        if (u.mh <= 0)
            rehumanize();
    }

    u.ubab = role_bab();
    g.context.botl = TRUE;
}

/*
 * Make experience gaining similar to AD&D(tm), whereby you can at most go
 * up by one level at a time, extra expr possibly helping you along.
 * After all, how much real experience does one get shooting a wand of death
 * at a dragon created with a wand of polymorph??
 */
void
newexplevel(void)
{
    if (u.ulevel < MAXULEV && u.uexp >= newuexp(u.ulevel))
        pluslvl(TRUE);
}

void
pluslvl(boolean incr) /* true iff via incremental experience growth */
{                     /*        (false for potion of gain level)    */
    int hpinc, eninc, skill;

    if (!incr)
        You_feel("more experienced.");

    /* Display the level up menu */
    if (!flags.simplelevels)
        levelup_menu();

    /* Increase class and race-specific skills. */
    for (skill = P_FIRST_ROLE; skill <= P_LAST_RACE; skill++) {
        if (!P_RESTRICTED(skill))
            use_skill(skill, rn1(3, 3) * P_SKILL(skill));
    }

    if (!u.uroleplay.marathon && !u.uroleplay.heaven_or_hell) {
        /* increase hit points (when polymorphed, do monster form first
           in order to retain normal human/whatever increase for later) */
        if (Upolyd) {
            hpinc = monhp_per_lvl(&g.youmonst);
            u.mhmax += hpinc;
            u.mh += hpinc;
        }
        hpinc = newhp();
        u.uhpmax += hpinc;
        u.uhp += hpinc;
    }

    /* increase spell power/energy points */
    eninc = newpw();
    u.uenmax += eninc;
    u.uen += eninc;

    /* increase level (unless already maxxed) */
    if (u.ulevel < MAXULEV) {
        int newrank, oldrank = xlev_to_rank(u.ulevel);

        /* increase experience points to reflect new level */
        if (incr) {
            long tmp = newuexp(u.ulevel + 1);

            if (u.uexp >= tmp)
                u.uexp = tmp - 1;
        } else {
            u.uexp = newuexp(u.ulevel);
        }
        ++u.ulevel;
        ++u.role_levels[flags.initrole];
        pline("Welcome %sto experience level %d.",
              (u.ulevelmax < u.ulevel) ? "" : "back ",
              u.ulevel);
        if (u.ulevelmax < u.ulevel)
            u.ulevelmax = u.ulevel;
        adjabil(u.ulevel - 1, u.ulevel, flags.initrole, u.role_levels[flags.initrole] - 1, u.role_levels[flags.initrole]); /* give new intrinsics */
        newrank = xlev_to_rank(u.ulevel);
        if (newrank > oldrank)
            record_achievement(achieve_rank(newrank));
    }
    u.ubab = role_bab();
    g.context.botl = TRUE;
}

/* compute a random amount of experience points suitable for the hero's
   experience level:  base number of points needed to reach the current
   level plus a random portion of what it takes to get to the next level */
long
rndexp(boolean gaining) /* gaining XP via potion vs setting XP for polyself */
{
    long minexp, maxexp, diff, factor, result;

    minexp = (u.ulevel == 1) ? 0L : newuexp(u.ulevel - 1);
    maxexp = newuexp(u.ulevel);
    diff = maxexp - minexp, factor = 1L;
    /* make sure that `diff' is an argument which rn2() can handle */
    while (diff >= (long) LARGEST_INT)
        diff /= 2L, factor *= 2L;
    result = minexp + factor * (long) rn2((int) diff);
    /* 3.4.1:  if already at level 30, add to current experience
       points rather than to threshold needed to reach the current
       level; otherwise blessed potions of gain level can result
       in lowering the experience points instead of raising them */
    if (u.ulevel == MAXULEV && gaining) {
        result += (u.uexp - minexp);
        /* avoid wrapping (over 400 blessed potions needed for that...) */
        if (result < u.uexp)
            result = u.uexp;
    }
    return result;
}

/* For multiclassing */
static void
levelup_menu(void) {
    winid win;
    anything any;
    int n, skill;
    menu_item *selected;
    char buf[BUFSZ];


    /* Convicts CANNOT switch roles. The player can certanly switch into convict if they want, although I
       am not sure what purpose they would do so. Perhaps to defeat the rat king or prepare for demogorgon? - Kes */
    if (Role_if(PM_CONVICT))
        return;

    while(1) {
        win = create_nhwindow(NHW_MENU);
        start_menu(win, MENU_BEHAVE_STANDARD);
        any = cg.zeroany;
        Sprintf(buf, "You are leveling up as a %s.",
                roles[g.urole.malenum - PM_ARCHEOLOGIST].name.m);
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, buf,
                    MENU_ITEMFLAGS_NONE);
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "You may choose to invest your experience in multiple roles.",
                    MENU_ITEMFLAGS_NONE);
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "Doing so will result in a permanent experience penalty.",
                    MENU_ITEMFLAGS_NONE);
        buf[0] = '\0';
        /* Display skills one stands to gain. */
        Sprintf(buf, "If you level up as a %s, you will gain experience in the following skills:",
                roles[g.urole.malenum - PM_ARCHEOLOGIST].name.m);
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, buf,
                    MENU_ITEMFLAGS_NONE);
        for (skill = P_FIRST_ROLE; skill <= P_LAST_ROLE; skill++) {
            if (!P_RESTRICTED(skill)) {
                buf[0] = '\0';
                Sprintf(buf, "  * %s", skill_name(skill));
                add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, buf,
                    MENU_ITEMFLAGS_NONE);
            }
        }
        /* Display HP and PW gain. */
        buf[0] = '\0';
        Sprintf(buf, "You will gain (1d%d) + (1d%d) hit points, modified by constitution.",
            u.ulevel < g.urole.xlev ? g.urole.hpadv.lornd : g.urole.hpadv.hirnd,
            u.ulevel < g.urole.xlev ? g.urace.hpadv.lornd : g.urole.hpadv.hirnd);
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, buf,
                    MENU_ITEMFLAGS_NONE);
        buf[0] = '\0';
        Sprintf(buf, "You will gain (1d%d) + (1d%d) power, modified by wisdom.",
            u.ulevel < g.urole.xlev ? g.urole.enadv.lornd : g.urole.enadv.hirnd,
            u.ulevel < g.urole.xlev ? g.urace.enadv.lornd : g.urole.enadv.hirnd);
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, buf,
                    MENU_ITEMFLAGS_NONE);
        /* Display special warnings. */
        if (g.urole.malenum == PM_MONK)
            add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "You will be constricted by body armor.",
                    MENU_ITEMFLAGS_NONE);
        if (g.urole.malenum == PM_DRAGON_RIDER)
            add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "You will be unable to wear dragon-based armor.",
                    MENU_ITEMFLAGS_NONE);
        if (g.urole.malenum == PM_CONVICT)
            add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "You will be unable to switch roles again.",
                    MENU_ITEMFLAGS_NONE);
        if (g.urole.malenum == PM_KNIGHT || g.urole.malenum == PM_SAMURAI)
            add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "You will be bound by a code of honor.",
                    MENU_ITEMFLAGS_NONE);
        /* Display options */
        any.a_int = 1;
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_INVERSE, "Finish Leveling Up",
                    MENU_ITEMFLAGS_NONE);
        any.a_int = 2;
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "View character sheet",
                    MENU_ITEMFLAGS_NONE);
        any.a_int = 3;
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "Enhance skills",
                    MENU_ITEMFLAGS_NONE);
        any.a_int = 4;
        add_menu(win, &nul_glyphinfo, &any, 0, 0, ATR_NONE, "Change roles",
                    MENU_ITEMFLAGS_NONE);
        end_menu(win, "You have gained a level!");
        n = select_menu(win, PICK_ONE, &selected);
        if (n > 0) n = selected[0].item.a_int;
        switch(n) {
        case 1:
            destroy_nhwindow(win);
            return;
            break;
        case 2:
            enlightenment(BASICENLIGHTENMENT, ENL_GAMEINPROGRESS);
            break;
        case 3:
            enhance_weapon_skill();
            break;
        case 4:
            roleswitch_menu();
            break;
        }
        destroy_nhwindow(win);
    }
}

static void
roleswitch_menu(void) {
    winid win;
    anything any;
    int i, n;
    boolean role_ok;
    menu_item *selected;
    char rolenamebuf[50];
    short old_ldrnum, old_neminum, old_guardnum, old_questarti;
    const char *old_ngod;
    const char *old_lgod;
    const char *old_cgod;
    const char *old_filecode;

    win = create_nhwindow(NHW_MENU);
    start_menu(win, MENU_BEHAVE_STANDARD);


    any = cg.zeroany; /* zero out all bits */
    for (i = 0; i < NUM_ROLES; i++) {
        role_ok = ((ok_role(i, flags.initrace, flags.female, u.ualign.type)
                    && ok_race(i, flags.initrace, flags.female, u.ualign.type)
                    && ok_gend(i, flags.initrace, flags.female, u.ualign.type)
                    && ok_align(i, flags.initrace, flags.female, u.ualign.type))
                  || i == flags.initrole);
        if (!role_ok)
            continue;
        Strcpy(rolenamebuf, roles[i].name.m);
        if (roles[i].name.f && flags.female == FEMALE) {
            Strcpy(rolenamebuf, roles[i].name.f);
        } else if (roles[i].name.n && flags.female == NEUTRAL) {
            Strcpy(rolenamebuf, roles[i].name.n);
        }
        any.a_int = i + 1;
        add_menu(win, &nul_glyphinfo, &any, 0, 0, i == flags.initrole ? ATR_INVERSE : ATR_NONE, rolenamebuf,
                 (!role_ok) ? MENU_ITEMFLAGS_SELECTED : MENU_ITEMFLAGS_NONE);
    }
    end_menu(win, "Which role do you want to switch into?");
    n = select_menu(win, PICK_ONE, &selected);
    destroy_nhwindow(win);
    if (n > 0) n = selected[0].item.a_int - 1;
    else return;
    /* Add index for save and reload */
    if (!flags.original_role) flags.original_role = flags.initrole;
    /* Get old quest and god info. */
    old_ldrnum = g.urole.ldrnum;
    old_neminum = g.urole.neminum;
    old_guardnum = g.urole.guardnum;
    old_questarti = g.urole.questarti;
    old_ngod = g.urole.ngod;
    old_lgod = g.urole.lgod;
    old_cgod = g.urole.cgod;
    old_filecode = g.urole.filecode;
    /* Switch roles. */
    flags.initrole = n;
    g.urole = roles[flags.initrole];
    switch_role_skills(get_role_skills(flags.initrole));
    /* Transfer over quest and god info. */
    g.urole.ldrnum = old_ldrnum;
    g.urole.neminum = old_neminum;
    g.urole.guardnum = old_guardnum;
    g.urole.questarti = old_questarti;
    g.urole.ngod = old_ngod;
    g.urole.lgod = old_lgod;
    g.urole.cgod = old_cgod;
    g.urole.filecode = old_filecode;
}

/*exper.c*/
