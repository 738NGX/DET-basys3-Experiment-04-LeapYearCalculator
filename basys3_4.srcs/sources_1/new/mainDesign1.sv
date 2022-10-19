`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 上海财经大学 信息管理与工程学院
// Engineer: 吉宁岳 2022111899
// 
// Create Date: 2022/10/18 10:50:55
// Design Name: Leap Year Calculator
// Module Name: mainDesign1
//////////////////////////////////////////////////////////////////////////////////


module mainDesign1(
    input  logic CLK100MHZ,
    input  logic [15:0] SW,
    output logic [6:0] a2g,
    output logic [3:0] AN,
    output logic [15:0] LED,
    output logic DP
);
    logic [15:0] x;
    assign LED = SW;
    assign x = SW;
    int y;
    
    assign y = 'd1000*x[15:12]+'d100*x[11:8]+'d10*x[7:4]+'d1*x[3:0];
    assign DP = !(((y%'d4=='d0&&y%'d100!='d0)||(y%'d400=='d0))&&(y>='d1582));

    assistDesign1 X71(.x(x),
             .clk(CLK100MHZ),
             .a2g(a2g),
             .AN(AN),
             .dp(DP));

endmodule
