/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

unsigned int* X0_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR;
unsigned int* X1_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x04;
unsigned int* X2_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x08;
unsigned int* X3_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x0c;
unsigned int* X4_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x10;
unsigned int* X5_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x14;
unsigned int* X6_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x18;
unsigned int* X7_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x1c;
unsigned int* X8_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x20;
unsigned int* X9_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x24;
unsigned int* X10_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x28;
unsigned int* X11_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x2c;
unsigned int* X12_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x30;
unsigned int* X13_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x34;
unsigned int* X14_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x38;
unsigned int* X15_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x3c;
unsigned int* X16_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x40;
unsigned int* X17_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x44;
unsigned int* X18_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x48;
unsigned int* X19_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x4c;
unsigned int* X20_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x50;
unsigned int* X21_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x54;
unsigned int* X22_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x58;
unsigned int* X23_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x5c;
unsigned int* X24_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x60;
unsigned int* X25_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x64;
unsigned int* X26_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x68;
unsigned int* X27_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x6c;
unsigned int* X28_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x70;
unsigned int* X29_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x74;
unsigned int* X30_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x78;
unsigned int* X31_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x7c;
unsigned int* Y0_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x80;
unsigned int* Y1_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x84;
unsigned int* Y2_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x88;
unsigned int* Y3_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x8c;
unsigned int* Y4_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x90;
unsigned int* Y5_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x94;
unsigned int* Y6_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x98;
unsigned int* Y7_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0x9c;
unsigned int* Y8_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xA0;
unsigned int* Y9_start       = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xA4;
unsigned int* Y10_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xA8;
unsigned int* Y11_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xAc;
unsigned int* Y12_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xB0;
unsigned int* Y13_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xB4;
unsigned int* Y14_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xB8;
unsigned int* Y15_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xBc;
unsigned int* L_start        = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xC0;
unsigned int* PREP_start     = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xC4;
unsigned int* START_start    = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xC8;
unsigned int* ACT_start      = (unsigned int*) XPAR_BASH_HASH_VERILOG_WR_0_BASEADDR + 0xCC;
int main()
{
    init_platform();

    print("Hello World\n\r");
    print("Successfully ran Hello World application");
    print("ewqeqweqwWorld\n\r");
    *X0_start = 1234;
    xil_printf("X: %x\r\n", *X0_start);

    *X0_start  = 77555;
    xil_printf("aaaaX: %x\r\n", *X0_start );
    *X1_start = 765;
    xil_printf("wqeX: %x\r\n", *X1_start);
    xil_printf("weqqweX: %x\r\n", *X0_start);
    xil_printf("wqeX: %x\r\n", *X1_start);
    *X0_start  = 0xB194BAC8;
    *X1_start  = 0x0A08F53B;
    *X2_start  = 0x366D008E;
    *X3_start  = 0x584A5DE4;
    *X4_start  = 0x8504FA9D;
    *X5_start  = 0x1BB6C7AC;
    *X6_start  = 0x252E72C2;
    *X7_start  = 0x02FDCE0D;
    *X8_start  = 0x5BE3D612;
    *X9_start  = 0x17B96181;
    *X10_start = 0xFE6786AD;
    *X11_start = 0x716B890B;
    *X12_start = 0x5CB0C0FF;
    *X13_start = 0x33C356B8;
    *X14_start = 0x35C405AE;
    *X15_start = 0xD8E07F99;
    *X16_start = 0xE12BDC1A;
    *X17_start = 0xE28257EC;
    *X18_start = 0x703FCCF0;
    *X19_start = 0x95EE8DF1;
    *X20_start = 0xC1AB7638;
    *X21_start = 0x9FE678CA;
    *X22_start = 0xF7C6F860;
    *X23_start = 0xD5BB9C4F;
    *X24_start = 0xF33C657B;
    *X25_start = 0x637C306A;
    *X26_start = 0xDD4EA779;
    *X27_start = 0x9EB23D31;
    *X28_start = 0x3E98B56E;
    *X29_start = 0x27D3BCCF;
    *X30_start = 0x591E181F;
    *X31_start = 0x4C5AB740;

    *L_start = 128;
    *PREP_start = 0xffff;
    xil_printf("X: %x\r\n", *L_start );
    *START_start = 0xffff;
    *START_start = 0x0;
    xil_printf("L: %x\r\n", *L_start );
    xil_printf("status: %x\r\n", *ACT_start );
    
    xil_printf("Y: %x\r\n", *Y0_start );
    xil_printf("Y: %x\r\n", *Y1_start );
    xil_printf("Y: %x\r\n", *Y2_start );
    xil_printf("Y: %x\r\n", *Y3_start );
    xil_printf("Y: %x\r\n", *Y4_start );
    xil_printf("Y: %x\r\n", *Y5_start );
    xil_printf("Y: %x\r\n", *Y6_start );
    xil_printf("Y: %x\r\n", *Y7_start );
    xil_printf("Y: %x\r\n", *Y8_start );
    xil_printf("Y: %x\r\n", *Y9_start );
    xil_printf("Y: %x\r\n", *Y10_start);
    xil_printf("Y: %x\r\n", *Y11_start);
    xil_printf("Y: %x\r\n", *Y12_start);
    xil_printf("Y: %x\r\n", *Y13_start);
    xil_printf("Y: %x\r\n", *Y14_start);
    xil_printf("Y: %x\r\n", *Y15_start);

    xil_printf("X: %x\r\n", *X2_start);
    xil_printf("X: %x\r\n", *X3_start );
    xil_printf("X: %x\r\n", *X4_start );
    xil_printf("X: %x\r\n", *X5_start );
    xil_printf("X: %x\r\n", *X6_start );
    xil_printf("X: %x\r\n", *X7_start );
    xil_printf("X: %x\r\n", *X8_start );
    xil_printf("X: %x\r\n", *X9_start );
    xil_printf("X: %x\r\n", *X10_start);
    xil_printf("X: %x\r\n", *X11_start);
    xil_printf("X: %x\r\n", *X12_start);
    xil_printf("X: %x\r\n", *X13_start);
    xil_printf("X: %x\r\n", *X14_start);
    xil_printf("X: %x\r\n", *X15_start);
    xil_printf("X: %x\r\n", *X16_start);
    xil_printf("X: %x\r\n", *X17_start);
    xil_printf("X: %x\r\n", *X18_start);
    xil_printf("X: %x\r\n", *X19_start);
    xil_printf("X: %x\r\n", *X20_start);
    xil_printf("X: %x\r\n", *X21_start);
    xil_printf("X: %x\r\n", *X22_start);
    xil_printf("X: %x\r\n", *X23_start);
    xil_printf("X: %x\r\n", *X24_start);
    xil_printf("X: %x\r\n", *X25_start);
    xil_printf("X: %x\r\n", *X26_start);
    xil_printf("X: %x\r\n", *X27_start);
    xil_printf("X: %x\r\n", *X28_start);
    xil_printf("X: %x\r\n", *X29_start);
    xil_printf("X: %x\r\n", *X30_start);
    xil_printf("X: %x\r\n", *X31_start);
    cleanup_platform();
    return 0;
}

