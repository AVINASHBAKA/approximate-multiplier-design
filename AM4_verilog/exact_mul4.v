// Exact 4x4 multiplier (reference)
// -------------------------
module exact_mul4 (a,b,y);
    input  [3:0] a;
    input  [3:0] b;
    output [7:0] y;
    assign y = a * b;
endmodule
// helper modules
module fa(input x,y,cin, output s,cout);
input x,y,cin;
output s,cout;
    assign s = x^y^cin;
    assign cout = (x&y)|(y&cin)|(cin&x);
endmodule
module ha(input x,y, output s,c);
input x,y;
output s,c;
    assign s = x ^ y;
    assign c = x & y;
endmodule
