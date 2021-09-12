#!/usr/bin/perl

use Switch;

sub build_skill {
    $skill = @_[0];
    $skill =~ s/P_|-P_//;
    $skill =~ s/TWO_HANDED/two-haned/;
    $skill =~ s/_/ /;
    $skill = lc $skill;
    return $skill;
}

# Every time I have to do a hack like this, my frustration with dmgval()
# increases.
sub add_small_damage {
    $sdam = @_[0];
    $name = @_[1];
    switch ($name) {
        case 'mace' {$sdam = "$sdam + 1"}
        case 'war hammer' {$sdam = "$sdam + 1"}
        case 'spetum' {$sdam = "$sdam + 1"}
        case 'trident' {$sdam = "$sdam + 1"}
        case 'spiked chain' {$sdam = "$sdam + 1"}
        case 'battle axe' {$sdam = "$sdam + 1d4"}
        case 'guisarme' {$sdam = "$sdam + 1d4"}
        case 'lucern hammer' {$sdam = "$sdam + 1d4"}
        case 'morning star' {$sdam = "$sdam + 1d4"}
        case 'ranseur' {$sdam = "$sdam + 1d4"}
        case 'broadsword' {$sdam = "$sdam + 1d4"}
        case 'elven broadsword' {$sdam = "$sdam + 1d4"}
        case 'runesword' {$sdam = "$sdam + 1d4"}
        case 'voulge' {$sdam = "$sdam + 1d4"}
        case 'scythe' {$sdam = "$sdam + 1d4"}
    }
    return $sdam;
}

sub add_large_damage {
    $ldam = @_[0];
    $name = @_[1];
    switch ($name) {
        case 'morning star' {$ldam = "$ldam + 1"}
        case 'nasty pike' {$ldam = "$ldam + 1"}
        case 'runesword' {$ldam = "$ldam + 1"}
        case 'elven broadsword' {$ldam = "$ldam + 1"}
        case 'broadsword' {$ldam = "$ldam + 1"}
        case 'flail' {$ldam = "$ldam + 1d4"}
        case 'ranseur' {$ldam = "$ldam + 1d4"}
        case 'voulge' {$ldam = "$ldam + 1d4"}
        case 'scythe' {$ldam = "$ldam + 1d4"}
        case 'halberd' {$ldam = "$ldam + 1d6"}
        case 'spetum' {$ldam = "$ldam + 1d6"}
        case 'battle axe' {$ldam = "$ldam + 2d4"}
        case 'bardiche' {$ldam = "$ldam + 2d4"}
        case 'trident' {$ldam = "$ldam + 2d4"}
        case 'spiked chain' {$ldam = "$ldam + 2d4"}
        case 'tsurugi' {$ldam = "$ldam + 2d6"}
        case 'dwarvish mattock' {$ldam = "$ldam + 2d6"}
        case 'two-handed sword' {$ldam = "$ldam + 2d6"}
    }
    return $ldam;
}

open(INFILE, "<../src/objects.c") or die "Failed to open objects.c: $!";
open(OUTFILE, ">wikitable_weapons.txt") or die "Failed to open outfile: $!";

$in_wep = 0;
$ wep = "";
print OUTFILE "{|class=\"prettytable striped sortable\"\n";
print OUTFILE "! Weapon !! Appearance !! 2H !! data-sort-type=\"number\"|Cost !! data-sort-type=\"number\"|Weight !! colspan=\"2\" class=unsortable | <span class=\"explain\" title=\"Damage to small/large monster\">Damage&nbsp;(S/L)</span> !! data-sort-type=\"number\"|To-Hit Bonus !! data-sort-type=\"number\"|AC Bonus !! Damage Type !! Skill !! Material\n";
while(<INFILE>) {
    # Skip the object definitions.
    if ($_ =~ /#define/) {
        next;
    }
    if ($in_wep) {
        my @splitline = split(m/\t|\s+|\),|, +|,|\n/, "$_");
        my @bimanual = @splitline[3] ? "x" : "";
        my @wt = "@splitline[5]";
        my @cost = "@splitline[6] zm";
        $sdam = add_small_damage("1d@splitline[7]", $wep);
        $ldam = add_large_damage("1d@splitline[8]", $wep);
        my @tohit = @splitline[9];
        my @ac = @splitline[10];
        my @typ = @splitline[11];
        $skill = @splitline[12];
        $skill = build_skill($skill);
        $material = @splitline[13];
        $material = lc $material;
        print OUTFILE "@bimanual || @cost || @wt || $sdam || $ldam || @tohit || @ac || @typ || $skill || $material\n"
    }
    if ($_ =~ /(\),)/) {
        $in_wep = 0;
    }
    if ($_ =~ /(WEAPON\()/) {
        $in_wep = 1;
        my @splitline = split(m/, |,|\n/, "$_");
        $wep = @splitline[0];
        $wep =~ s/"|WEAPON\(//g;
        $desc = @splitline[1];
        $desc =~ s/"|None//g;
        print OUTFILE "|-\n|'''$wep'''|| $desc || ";
    }
}
print OUTFILE "|}";

close(INFILE);
close(OUTFILE);