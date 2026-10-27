// AM4_OR: OR-based 4x4 multiplier
// -------------------------
module AM4_OR (a,b,y);
    input  [3:0] a;
    input  [3:0] b;
    output [7:0] y;
    wire pp00 = a[0] & b[0];
    wire pp01 = a[0] & b[1];
    wire pp02 = a[0] & b[2];
    wire pp03 = a[0] & b[3];
    wire pp10 = a[1] & b[0];
    wire pp11 = a[1] & b[1];
    wire pp12 = a[1] & b[2];
    wire pp13 = a[1] & b[3];
    wire pp20 = a[2] & b[0];
    wire pp21 = a[2] & b[1];
    wire pp22 = a[2] & b[2];
    wire pp23 = a[2] & b[3];
    wire pp30 = a[3] & b[0];
    wire pp31 = a[3] & b[1];
    wire pp32 = a[3] & b[2];
    wire pp33 = a[3] & b[3];
    assign y[0] = pp00;
    assign y[1] = pp01 | pp10;
    assign y[2] = pp02 | pp11 | pp20;
    assign y[3] = pp03 | pp12 | pp21 | pp30;
    assign y[4] = pp13 | pp22 | pp31;
    assign y[5] = pp23 | pp32;
    assign y[6] = pp33;
    assign y[7] = 1'b0;
endmodule
