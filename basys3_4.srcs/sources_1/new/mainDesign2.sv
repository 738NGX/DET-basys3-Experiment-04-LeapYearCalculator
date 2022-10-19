`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 上海财经大学 信息管理与工程学院
// Engineer: 吉宁岳 2022111899
// 
// Module Name: mainDesign2
//////////////////////////////////////////////////////////////////////////////////

module mainDesign2(
    input  logic CLK100MHZ,
    input  logic [15:0] SW,
    output logic [6:0] a2g,
    output logic [3:0] AN,
    output logic [15:0] LED,
    output logic DP
);
    logic [15:0] x;
    logic D4;
    logic D100;
    logic D400;

    assign D4=((!SW[4])&&(!SW[1])&&(!SW[0]))||((SW[4])&&(SW[1])&&(!SW[0]));
    assign D100=(!SW[7])&&(!SW[6])&&(!SW[5])&&(!SW[4])&&(!SW[3])&&(!SW[2])&&(!SW[1])&&(!SW[0]);
    assign D400=D100&&(((!SW[12])&&(!SW[9])&&(!SW[8]))||((SW[12])&&(SW[9])&&(!SW[8])));
    assign DP=!((D4&&!D100)||D400);
    assign LED = SW;
    assign x = SW;

    assistDesign2 X72(.x(x),
             .clk(CLK100MHZ),
             .a2g(a2g),
             .AN(AN),
             .dp(DP));

endmodule
