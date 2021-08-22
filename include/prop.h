/* NetHack 3.7	prop.h	$NHDT-Date: 1596498555 2020/08/03 23:49:15 $  $NHDT-Branch: NetHack-3.7 $:$NHDT-Revision: 1.22 $ */
/* Copyright (c) 1989 Mike Threepoint				  */
/* NetHack may be freely redistributed.  See license for details. */

#ifndef PROP_H
#define PROP_H

/*** What the properties are ***
 *
 * note:  propertynames[] array in timeout.c has string values for these.
 *        Property #0 is not used.
 */
/* Resistances to troubles */
enum prop_types {
    FIRE_RES          =  1,
    COLD_RES          =  2,
    SLEEP_RES         =  3,
    DISINT_RES        =  4,
    SHOCK_RES         =  5,
    POISON_RES        =  6,
    ACID_RES          =  7,
    STONE_RES         =  8,
    SONIC_RES         =  9,
    PSYCHIC_RES       =  10,
    /* note: for the first eight properties, MR_xxx == (1 << (xxx_RES - 1)) */
    DRAIN_RES         =  11,
    SICK_RES          = 12,
    INVULNERABLE      = 13,
    ANTIMAGIC         = 14,
    /* Troubles */
    STUNNED           = 15,
    CONFUSION         = 16,
    AFRAID            = 17,
    BLINDED           = 18,
    DEAF              = 19,
    SICK              = 20,
    STONED            = 21,
    STRANGLED         = 22,
    VOMITING          = 23,
    GLIB              = 24,
    SLIMED            = 25,
    HALLUC            = 26,
    HALLUC_RES        = 27,
    FUMBLING          = 28,
    WOUNDED_LEGS      = 29,
    SLEEPY            = 30,
    HUNGER            = 31,
    /* Vision and senses */
    SEE_INVIS         = 32,
    TELEPAT           = 33,
    WARNING           = 34,
    WARN_OF_MON       = 35,
    WARN_UNDEAD       = 36,
    SEARCHING         = 37,
    CLAIRVOYANT       = 38,
    INFRAVISION       = 39,
    DETECT_MONSTERS   = 40,
    /* Appearance and behavior */
    ADORNED           = 41,
    INVIS             = 42,
    DISPLACED         = 43,
    STEALTH           = 44,
    AGGRAVATE_MONSTER = 45,
    CONFLICT          = 46,
    /* Transportation */
    JUMPING           = 47,
    TELEPORT          = 48,
    TELEPORT_CONTROL  = 49,
    LEVITATION        = 50,
    FLYING            = 51,
    WWALKING          = 52,
    SWIMMING          = 53,
    MAGICAL_BREATHING = 54,
    PASSES_WALLS      = 55,
    /* Physical attributes */
    SLOW_DIGESTION    = 56,
    HALF_SPDAM        = 57,
    HALF_PHDAM        = 58,
    REGENERATION      = 59,
    ENERGY_REGENERATION = 60,
    PROTECTION        = 61,
    PROT_FROM_SHAPE_CHANGERS = 62,
    POLYMORPH         = 63,
    POLYMORPH_CONTROL = 64,
    UNCHANGING        = 65,
    FAST              = 66,
    REFLECTING        = 67,
    FREE_ACTION       = 68,
    FIXED_ABIL        = 69,
    STABLE            = 70,
    LIFESAVED         = 71
};
#define LAST_PROP (LIFESAVED)

/*** Where the properties come from ***/
/* Definitions were moved here from obj.h and you.h */
struct prop {
    /*** Properties conveyed by objects ***/
    long extrinsic;
/* Armor */
#define W_ARM 0x00000001L  /* Body armor */
#define W_ARMC 0x00000002L /* Cloak */
#define W_ARMH 0x00000004L /* Helmet/hat */
#define W_ARMS 0x00000008L /* Shield */
#define W_ARMG 0x00000010L /* Gloves/gauntlets */
#define W_ARMF 0x00000020L /* Footwear */
#define W_ARMU 0x00000040L /* Undershirt */
#define W_ARMOR (W_ARM | W_ARMC | W_ARMH | W_ARMS | W_ARMG | W_ARMF | W_ARMU)
/* Weapons and artifacts */
#define W_WEP 0x00000100L     /* Wielded weapon */
#define W_QUIVER 0x00000200L  /* Quiver for (f)iring ammo */
#define W_SWAPWEP 0x00000400L /* Secondary weapon */
#define W_WEAPONS (W_WEP | W_SWAPWEP | W_QUIVER)
#define W_ART 0x00001000L     /* Carrying artifact (not really worn) */
#define W_ARTI 0x00002000L    /* Invoked artifact  (not really worn) */
/* Amulets, rings, tools, and other items */
#define W_AMUL 0x00010000L    /* Amulet */
#define W_RINGL 0x00020000L   /* Left ring */
#define W_RINGR 0x00040000L   /* Right ring */
#define W_RING (W_RINGL | W_RINGR)
#define W_TOOL 0x00080000L   /* Eyewear */
#define W_ACCESSORY (W_RING | W_AMUL | W_TOOL)
    /* historical note: originally in slash'em, 'worn' saddle stayed in
       hero's inventory; in nethack, it's kept in the steed's inventory */
#define W_SADDLE 0x00100000L /* KMH -- For riding monsters */
#define W_BALL 0x00200000L   /* Punishment ball */
#define W_CHAIN 0x00400000L  /* Punishment chain */

    /*** Property is blocked by an object ***/
    long blocked; /* Same assignments as extrinsic */

    /*** Timeouts, permanent properties, and other flags ***/
    long intrinsic;
/* Timed properties */
#define TIMEOUT 0x00ffffffL     /* Up to 16 million turns */
                                /* Permanent properties */
#define FROMEXPER 0x01000000L   /* Gain/lose with experience, for role */
#define FROMRACE 0x02000000L    /* Gain/lose with experience, for race */
#define FROMOUTSIDE 0x04000000L /* By corpses, prayer, thrones, etc. */
#define INTRINSIC (FROMOUTSIDE | FROMRACE | FROMEXPER)
/* Control flags */
#define FROMFORM 0x10000000L  /* Polyd; conferred by monster form */
#define I_SPECIAL 0x20000000L /* Property is controllable */
};

/*** Definitions for backwards compatibility ***/
#define LEFT_RING W_RINGL
#define RIGHT_RING W_RINGR
#define LEFT_SIDE LEFT_RING
#define RIGHT_SIDE RIGHT_RING
#define BOTH_SIDES (LEFT_SIDE | RIGHT_SIDE)
#define WORN_ARMOR W_ARM
#define WORN_CLOAK W_ARMC
#define WORN_HELMET W_ARMH
#define WORN_SHIELD W_ARMS
#define WORN_GLOVES W_ARMG
#define WORN_BOOTS W_ARMF
#define WORN_AMUL W_AMUL
#define WORN_BLINDF W_TOOL
#define WORN_SHIRT W_ARMU

#endif /* PROP_H */
