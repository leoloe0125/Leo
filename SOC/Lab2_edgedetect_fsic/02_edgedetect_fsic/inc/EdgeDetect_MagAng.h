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


namespace EdgeDetect_IP 
{
  class EdgeDetect_MagAng
  {
  public:
    EdgeDetect_MagAng() {}
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<gradType4x> &dx_in,
                        ac_channel<gradType4x> &dy_in,

                        ac_channel<Stream_t>  &pix_chan2,
                        maxWType             &widthIn,
                        maxHType             &heightIn,

                        bool sw_in,

                        uint32 &crc32_pix_in,
                        uint32 &crc32_dat_out,


                        ac_channel<Stream_t>  &dat_out

                        // ac_channel<magType>  &magn,
                        // ac_channel<angType>  &angle
                        )
    {
      gradType4x dx, dy;
      pixelType asum[4];
      Stream_t channel2;
      Stream_t temp_sq_rt;
      Stream_t sum;
      sqType dx_sq;
      sqType dy_sq;
      // sumType sum; // fixed point integer for sqrt
      angType at;
      ac_fixed<16,9,false> sq_rt; // square-root return type
      crc32_pix_in = 0XFFFFFFFF;
      crc32_dat_out=0XFFFFFFFF;
      MROW: for (maxHType y = 0; ; y++) {
      // cout<<"12312312312"<<endl;
        #pragma hls_pipeline_init_interval 1
        MCOL: for (maxWType x = 0; ; x++) {
          // cout<<"============"<<endl;

          dx = dx_in.read();
          dy = dy_in.read();
      #pragma hls_unroll yes
        VLINE:for(int i=0;i<4;i++)
        {
          if (( abs(dx.slc<9>(9*i)) + abs(dy.slc<9>(9*i))>255))
          {
            asum[i] = 255;
          }
          else asum[i] = abs(dx.slc<9>(9*i)) + abs(dy.slc<9>(9*i));
        }
        sum.pix.set_slc(0 ,asum[0]);
        sum.pix.set_slc(8 ,asum[1]);
        sum.pix.set_slc(16,asum[2]);
        sum.pix.set_slc(24,asum[3]);
          sum.sof=(x==0&&y==0);
          sum.eol=(x==maxWType(widthIn-4));


          channel2=pix_chan2.read();
          crc32_pix_in = calc_crc32(crc32_pix_in, channel2.pix);
          if (sw_in == 1) {
              dat_out.write(sum);
              crc32_dat_out = calc_crc32(crc32_dat_out, sum.pix);
          } else {
              dat_out.write(channel2);
              crc32_dat_out = calc_crc32(crc32_dat_out, channel2.pix);
          }
          // cout<<crc32_dat_out<<endl;
          if (x == maxWType(widthIn/4-1)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        if (y == maxHType(heightIn-1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
          crc32_pix_in=~crc32_pix_in;
          crc32_dat_out=~crc32_dat_out;

    }
  private:
    template <int len>
    uint32 calc_crc32(uint32 crc_in, ac_int<len, false> dat_in)
    {
      const uint32 CRC_POLY = 0xEDB88320;
      uint32 crc_tmp = crc_in;

      #pragma hls_unroll yes
      for(int i=0; i<len; i++)
      {
        uint1 tmp_bit = crc_tmp[0] ^ dat_in[i];

        uint31 mask;

        #pragma hls_unroll yes
        for(int i=0; i<31; i++)
          mask[i] = tmp_bit & CRC_POLY[i];

        uint31 crc_tmp_h31 = crc_tmp.slc<31>(1);
   
        crc_tmp_h31 ^= mask;
        
        crc_tmp.set_slc(31,tmp_bit);
        crc_tmp.set_slc(0,crc_tmp_h31);
      }
      return crc_tmp;
    }
      gradType abs(gradType din)
    {
      if(din <= 0) return -1*din;
      else return din;
    }

  };

}


