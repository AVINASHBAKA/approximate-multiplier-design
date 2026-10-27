// Testbenches
// ==============================================================
module tb_AM4;
    reg [3:0] a,b;
    wire [7:0] y_or,y1,y2,y3,y4,y5,y_exact;
    // instantiate all multipliers
    AM4_OR   dut_or(.a(a),.b(b),.y(y_or));
    AM4_T1   dut1(.a(a),.b(b),.y(y1));
    AM4_T2   dut2(.a(a),.b(b),.y(y2));
    AM4_T3   dut3(.a(a),.b(b),.y(y3));
    AM4_T4   dut4(.a(a),.b(b),.y(y4));
    AM4_T5   dut5(.a(a),.b(b),.y(y5));
    exact_mul4 dut_ex(.a(a),.b(b),.y(y_exact));
    integer i,j;
    initial begin
        $display("a b | exact OR T1 T2 T3 T4 T5");
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                a=$random; b=$random; #1;
                $display("%d %d | %d %d %d %d %d %d %d",a,b,y_exact,y_or,y1,y2,y3,y4,y5);
            end
        end
        $finish;
    end
endmodule
