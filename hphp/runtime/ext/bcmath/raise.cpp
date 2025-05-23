/* raise.c: bcmath library file. */
/*
    Copyright (C) 1991, 1992, 1993, 1994, 1997 Free Software Foundation, Inc.
    Copyright (C) 2000 Philip A. Nelson

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.  (COPYING.LIB)

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to:

      The Free Software Foundation, Inc.
      51 Franklin Street, Fifth Floor
      Boston, MA  02110-1301, USA

    You may contact the author by:
       e-mail:  philnelson@acm.org
      us-mail:  Philip A. Nelson
                Computer Science Department, 9062
                Western Washington University
                Bellingham, WA 98226-9062

*************************************************************************/

#include "hphp/runtime/ext/bcmath/bcmath.h"

#include <folly/ScopeGuard.h>

/* Raise NUM1 to the NUM2 power.  The result is placed in RESULT.
   Maximum exponent is LONG_MAX.  If a NUM2 is not an integer,
   only the integer part is used.  */

void
bc_raise (bc_num num1, bc_num num2, bc_num *result, int scale TSRMLS_DC)
{
   bc_num temp, power;
   long exponent;
   int rscale;
   int pwrscale;
   int calcscale;
   char neg;

   /* Check the exponent for scale digits and convert to a long. */
   if (num2->n_scale != 0)
     bc_rt_warn ("non-zero scale in exponent");
   exponent = bc_num2long (num2);
   if (exponent == 0 && (num2->n_len > 1 || num2->n_value[0] != 0))
       bc_rt_error ("exponent too large in raise");

   /* Special case if exponent is a zero. */
   if (exponent == 0)
     {
       bc_free_num (result);
       *result = bc_copy_num (BCG(_one_));
       return;
     }

   /* Other initializations. */
   if (exponent < 0)
     {
       neg = TRUE;
       exponent = -exponent;
       rscale = scale;
     }
   else
     {
       neg = FALSE;
       rscale = MIN (num1->n_scale*exponent, MAX(scale, num1->n_scale));
     }

   /* Set initial value of temp.  */
   power = bc_copy_num (num1);
   SCOPE_EXIT { bc_free_num(&power); };
   pwrscale = num1->n_scale;
   while ((exponent & 1) == 0)
     {
       pwrscale = 2*pwrscale;
       bc_multiply (power, power, &power, pwrscale TSRMLS_CC);
       exponent = exponent >> 1;
     }
   temp = bc_copy_num (power);
   SCOPE_FAIL { bc_free_num(&temp); };
   calcscale = pwrscale;
   exponent = exponent >> 1;

   /* Do the calculation. */
   while (exponent > 0)
     {
       pwrscale = 2*pwrscale;
       bc_multiply (power, power, &power, pwrscale TSRMLS_CC);
       if ((exponent & 1) == 1) {
	 calcscale = pwrscale + calcscale;
	 bc_multiply (temp, power, &temp, calcscale TSRMLS_CC);
       }
       exponent = exponent >> 1;
     }

   /* Assign the value. */
   if (neg)
     {
       bc_divide (BCG(_one_), temp, result, rscale TSRMLS_CC);
       bc_free_num (&temp);
     }
   else
     {
       bc_free_num (result);
       *result = temp;
       if ((*result)->n_scale > rscale)
	 (*result)->n_scale = rscale;
     }
}
