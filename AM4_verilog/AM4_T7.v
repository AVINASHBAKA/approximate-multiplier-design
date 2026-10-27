// ===========================================================
// Novel Approximate Multiplier AM4_T7
// ===========================================================
module AM4_T7 (
    input  [3:0] a,
    input  [3:0] b,
    output [7:0] y
);
    wire [3:0] pp0 = {4{a[0]}} & b;
    wire [3:0] pp1 = {4{a[1]}} & b;
    wire [3:0] pp2 = {4{a[2]}} & b;
    wire [3:0] pp3 = {4{a[3]}} & b;

    // Truncate LSBs (low power)
    assign y[0] = 1'b0;
    assign y[1] = 1'b0;
    assign y[2] = 1'b0;

    // Approximate mid bits
    assign y[3] = pp1[2] | pp2[1] | pp3[0]; // OR only
    assign y[4] = pp2[2] | pp1[3] | pp3[1];

    // More accurate upper bits
    assign y[5] = pp2[3] ^ pp3[2];
    assign y[6] = pp3[2] & pp3[3];
    assign y[7] = pp3[3];
endmodule
