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
 *  The most recent version of this package is available at github.       *
 *                                                                        *
 *************************************************************************/
#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>
using namespace std;

namespace EdgeDetect_IP {
class EdgeDetect_VerDer
  {
  private:
  
  public:
    EdgeDetect_VerDer() {}
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Stream_t> &dat_in,
                        maxWType              &widthIn,
                        maxHType              &heightIn,
                        ac_channel<Stream_t> &dat_out,
                        ac_channel<gradType4x>  &dy
                        )
    {
      pixelType8x line_buf0[maxImageWidth/2];
      pixelType8x line_buf1[maxImageWidth/2];
      pixelType8x rdbuf0_pix, rdbuf1_pix;
      pixelType8x wrbuf0_pix, wrbuf1_pix;
      Stream_t pix[3];
      pixelType pix_list[3][4];
      gradType gradian_list[4];
      gradType4x gradian;
      Stream_t pix1_4x;
      VROW: for (maxHType y = 0; ; y++) { // VROW has one extra iteration to ramp-up window
        #pragma hls_pipeline_init_interval 1
        VCOL: for (maxWType x = 0; ; x++) {
          if (y <= heightIn-1) {
            pix[0] = dat_in.read();
            }
          // Write data cache, write lower 8 on even iterations of COL loop, upper 8 on odd
          if ( (x&1) == 0 ) {
            wrbuf0_pix.set_slc(0,pix[0].pix);
            rdbuf1_pix = line_buf1[x/2];
            rdbuf0_pix = line_buf0[x/2];
             pix[2].pix = rdbuf1_pix.slc<32>(0);
             pix[1].pix = rdbuf0_pix.slc<32>(0);
          } else {
            wrbuf0_pix.set_slc(32,pix[0].pix);
            line_buf1[x/2] = rdbuf0_pix; // copy previous line
            line_buf0[x/2] = wrbuf0_pix; // store current line
            pix[2].pix = rdbuf1_pix.slc<32>(32);
            pix[1].pix = rdbuf0_pix.slc<32>(32);
  
          }
          if (y == 1) {
            pix[2] = pix[1]; // top boundary (replicate pix1 up to pix2)
          }
          if (y == heightIn) {
            pix[0] = pix[1]; // bottom boundary (replicate pix1 down to pix0)
          }
        #pragma hls_unroll yes
          VLINE:for(int i =0;i<4;i++)
          {
            #pragma hls_unroll yes
            VGINE:for(int j =0;j<3;j++){
              pix_list[j][i]= pix[j].pix.slc<8>(i*8);
            }
              gradian_list[i]=pix_list[0][i]*kernel[2]+pix_list[1][i]*kernel[1]+pix_list[2][i]*kernel[0];
          }
          gradian.set_slc(0 ,gradian_list[0]);
          gradian.set_slc(9 ,gradian_list[1]);
          gradian.set_slc(18,gradian_list[2]);
          gradian.set_slc(27,gradian_list[3]);
          if (y != 0) { // Write streaming interfaces
            dat_out.write(pix[1]); // Pass thru original data
            dy.write(gradian); // derivative output
          }
          if (x >= maxWType(widthIn/4-1)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        // programmable height exit condition
        if (y == heightIn) {
          break;
        }
      }
    }
  };
  }