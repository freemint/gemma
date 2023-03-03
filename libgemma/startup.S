/*
 * Startup code for thread_fork()
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

	.globl	__startup

__startup:
	move.l	4(%sp),%a0		/* basepage address */

	move.l	44(%a0),-(%sp)	/* release own environment */
	move.w	#0x0049,-(%sp)
	trap	#1
	addq.l	#6,%sp

	move.l	4(%sp),%a0		/* basepage address */
	move.l	16(%a0),%a1		/* p_dbase */

	lea	12(%a0),%a2
	move.l	#256,(%a2)+		/* p_tlen */
	clr.l	(%a2)+			/* p_dbase */
	clr.l	(%a2)+			/* p_dlen */
	clr.l	(%a2)+			/* p_bbase */
	clr.l	(%a2)+			/* p_blen */
	
	move.l	36(%a0),%a2		/* p_parent */
	move.l	44(%a2),44(%a0)	/* copy the environment pointer */

	move.l	4(%sp),-(%sp)
	move.l	#1,-(%sp)
	jsr	(%a1)
	addq.l	#8,%sp

	move.w	%d0,-(%sp)
	move.w	#0x004c,-(%sp)
	trap	#1
