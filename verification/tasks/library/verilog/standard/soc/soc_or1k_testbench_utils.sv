////////////////////////////////////////////////////////////////////////////////
//                                            __ _      _     _               //
//                                           / _(_)    | |   | |              //
//                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              //
//               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              //
//              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              //
//               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              //
//                  | |                                                       //
//                  |_|                                                       //
//                                                                            //
//                                                                            //
//              MPSoC-OR1K CPU                                                //
//              Processing Unit                                               //
//              Wishbone Bus Interface                                        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2015-2016 by the author(s)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////
// Author(s):
//   Paco Reina Campo <pacoreinacampo@queenfield.tech>

module soc_or1k_testbench_utils;
  parameter MAX_STRING_LEN = 128;
  localparam CHAR_WIDTH = 8;

  // Force simulation stop after timeout cycles
  reg [63:0] timeout;
  initial
    if ($value$plusargs("timeout=%d", timeout)) begin
      #timeout $display("Timeout: Forcing end of simulation");
      $finish;
    end

  // FIX-ME: Add more options for VCD logging
  reg [MAX_STRING_LEN*CHAR_WIDTH-1:0] testcase;

  initial begin
    if ($test$plusargs("vcd")) begin
      if ($value$plusargs("testcase=%s", testcase)) begin
        $dumpfile({testcase, ".vcd"});
      end else begin
        $dumpfile("testlog.vcd");
      end
      $dumpvars;
    end
  end

  // Heartbeat timer for simulations
  reg [63:0] heartbeat;
  initial begin
    if ($value$plusargs("heartbeat=%d", heartbeat)) begin
      forever #heartbeat $display("Heartbeat : Time=%0t", $time);
    end
  end
endmodule  // soc_or1k_testbench_utils
