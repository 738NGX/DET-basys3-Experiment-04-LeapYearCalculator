`timescale 1ns / 1ps

module assistDesign1(
              input  logic [15:0] x,
              input  logic        clk,
              input  logic        clr,
              output logic [6:0]  a2g,
              output logic [3:0]  AN, //�����ʹ��
              output logic        dp ); //С����
    
    logic [1:0] s;     //ѡ���ĸ������
    logic [3:0] digit;
    logic [19:0] clkdiv;

    assign s = clkdiv[19:18];// count every 10.4ms        
    
    //4������� 4ѡ1 (MUX44)
    always_comb
        case(s)
            0:  digit = x[3:0];
            1:  digit = x[7:4];
            2:  digit = x[11:8];
            3:  digit = x[15:12];
            default: digit = x[3:0];
        endcase
    
    //4������ܵ�ʹ��
    always_comb
        case(s)
            0:  AN = 4'b1110;
            1:  AN = 4'b1101;
            2:  AN = 4'b1011;
            3:  AN = 4'b0111;
            default: AN = 4'b1110;
        endcase
        
    // ʱ�ӷ�Ƶ����20λ�����Ƽ�������
    always @(posedge clk, posedge clr)
      if(clr == 1) clkdiv <= 0;
      else         clkdiv <= clkdiv + 1;
    
    //ʵ���� 7�������
    Dec7Seg s7(.x(digit), .a2g(a2g));    
endmodule