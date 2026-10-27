// ==========================================================
// Novel Approximate Multiplier AM4_T6
// ==========================================================
module AM4_T6 (
    input  [3:0] a,
    input  [3:0] b,
    output [7:0] y
);
    wire [3:0] pp0 = {4{a[0]}} & b;
    wire [3:0] pp1 = {4{a[1]}} & b;
    wire [3:0] pp2 = {4{a[2]}} & b;
    wire [3:0] pp3 = {4{a[3]}} & b;

    // Lower columns approximated with OR
    assign y[0] = pp0[0];
    assign y[1] = pp0[1] | pp1[0];
    assign y[2] = pp0[2] | pp1[1] | pp2[0];
    assign y[3] = pp0[3] | pp1[2] | pp2[1] | pp3[0];

    // Middle columns: simple HA-like logic
    assign y[4] = pp1[3] ^ pp2[2] ^ pp3[1];
    assign y[5] = (pp2[3] | pp3[2]);

    // Preserve accuracy on MSBs
    wire [1:0] sum_msb = pp3[2] + pp3[3];
    assign y[6] = sum_msb[0];
    assign y[7] = sum_msb[1];
endmodule
