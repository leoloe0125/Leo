/**************************************************************************
 *                                                                        *
 *  Edge Detect Design Walkthrough for HLS                                *
 *                                                                        *
 *  Software Version: 1.0                                                 *
 *                                                                        *
 *  Release Date    : Tue Jan 14 15:40:43 PST 2020                        *
 *  Release Type    : Production Release                                  *
 *  Release Build   : 1.0.0                                               *
 *                                                                        *
 *  Copyright 2020, Siemens                                               *
 *                                                                        *
 **************************************************************************
 *  Licensed under the Apache License, Version 2.0 (the "License");       *
 *  you may not use this file except in compliance with the License.      *
 *  You may obtain a copy of the License at                               *
 *                                                                        *
 *      http://www.apache.org/licenses/LICENSE-2.0                        *
 *                                                                        *
 *  Unless required by applicable law or agreed to in writing, software   *
 *  distributed under the License is distributed on an "AS IS" BASIS,     *
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or       *
 *  implied.                                                              *
 *  See the License for the specific language governing permissions and   *
 *  limitations under the License.                                        *
 **************************************************************************
 *                                                                        *
 *  The most recent 
 version of this package is available at github.       *
 *                                                                        *
 *************************************************************************/
#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>

namespace EdgeDetect_IP 
{
  class EdgeDetect_HorDer
  {
  public:
    EdgeDetect_HorDer() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Stream_t> &dat_in,
                        maxWType              &widthIn,
                        maxHType              &heightIn,
                        ac_channel<Stream_t>  &dat_out,
                        ac_channel<gradType4x>  &dx)
    {
      // pixel buffers store pixel history
      Stream_t pix_buf0; 
      Stream_t pix0,pix1;
      gradType gradian0,gradian1,gradian2,gradian3,gradian_buf0;
      gradType4x gradian;
      HROW: for (maxHType y = 0; ; y++) {
        // cout << "y is : "<< y << endl;
        #pragma hls_pipeline_init_interval 1
        HCOL: for (maxWType x = 0; ; x++) {
          // cout << "x is : "<< x << endl;

          if (x <= widthIn/4-1) {
            pix0 = dat_in.read(); // Read streaming interface
          }
          pix1 = pix_buf0;
          pix_buf0 = pix0;
          // Gradian : 
          if(x == 0)
          {
            gradian_buf0 = kernel[0]*pix0.pix.slc<8>(0) + pix0.pix.slc<8>(0)*kernel[1] + kernel[2]* pix0.pix.slc<8>(8);
          }
          else if (x == widthIn/4)
          { 
            gradian0 = kernel[0]*pix1.pix.slc<8>(0) + pix1.pix.slc<8>(8)*kernel[1] + kernel[2]*pix1.pix.slc<8>(16);
            gradian1 = kernel[0]*pix1.pix.slc<8>(8) + pix1.pix.slc<8>(16)*kernel[1] + kernel[2]*pix1.pix.slc<8>(24);
            gradian2 = kernel[0]*pix1.pix.slc<8>(16) + pix1.pix.slc<8>(24)*kernel[1] + kernel[2]*pix1.pix.slc<8>(24);
          } 
          else 
          { 
            gradian0 = kernel[0]*pix1.pix.slc<8>(0) + pix1.pix.slc<8>(8)*kernel[1] + kernel[2]*pix1.pix.slc<8>(16);
            gradian1 = kernel[0]*pix1.pix.slc<8>(8) + pix1.pix.slc<8>(16)*kernel[1] + kernel[2]*pix1.pix.slc<8>(24);
            gradian2 = kernel[0]*pix1.pix.slc<8>(16) + pix1.pix.slc<8>(24)*kernel[1] + kernel[2]*pix0.pix.slc<8>(0);
            gradian3 = kernel[0]*pix1.pix.slc<8>(24) + pix0.pix.slc<8>(0)*kernel[1] + kernel[2]*pix0.pix.slc<8>(8);
          }

          gradian.set_slc(0,gradian_buf0);
          gradian.set_slc(9,gradian0);
          gradian.set_slc(18,gradian1);
          gradian.set_slc(27,gradian2);
          if (x != 0) { // Write streaming interface
            dat_out.write(pix1); // Pass thru original data
            dx.write(gradian); // derivative out
          }
          if(x!=0)          gradian_buf0 = gradian3;
          if ( x == widthIn/4) {
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn-1)) { // cast to maxHType for RTL code coverage
          // cout << "y  succese" << endl;
          break;
        }
      }
    }
  };

}


