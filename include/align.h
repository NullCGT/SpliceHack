/* NetHack 3.7	align.h	$NHDT-Date: 1596498525 2020/08/03 23:48:45 $  $NHDT-Branch: NetHack-3.7 $:$NHDT-Revision: 1.11 $ */
/* Copyright (c) Mike Stephenson, Izchak Miller  1991.		  */
/* NetHack may be freely redistributed.  See license for details. */

/* Edited on 5/5/18 by NullCGT */

#ifndef ALIGN_H
#define ALIGN_H

typedef schar aligntyp; /* basic alignment type */

typedef struct align { /* alignment & record */
    aligntyp type;
    int record;
} align;

/* bounds for "record" -- respect initial alignments of 10 */
#define ALIGNLIM (10L + (g.moves / 200L))

#define A_NONE (-128) /* the value range of type */

#define A_CHAOTIC (-1)
#define A_NEUTRAL 0
#define A_LAWFUL 1

#define A_COALIGNED 1
#define A_OPALIGNED (-1)

#define AM_NONE 0
#define AM_CHAOTIC 1
#define AM_NEUTRAL 2
#define AM_LAWFUL 4

#define AM_MASK 7

#define AM_SPLEV_CO 3
#define AM_SPLEV_NONCO 7
#define AM_SPLEV_RANDOM 8

#define Amask2align(x)                                          \
    ((aligntyp)((!(x)) ? A_NONE : ((x) == AM_LAWFUL) ? A_LAWFUL \
                                                     : ((int) x) - 2))
#define Align2amask(x) \
    (((x) == A_NONE) ? AM_NONE : ((x) == A_LAWFUL) ? AM_LAWFUL : (x) + 2)

/* for altars */
#define a_align(x, y) ((aligntyp) Amask2align(levl[x][y].altarmask & AM_MASK))

#endif /* ALIGN_H */
