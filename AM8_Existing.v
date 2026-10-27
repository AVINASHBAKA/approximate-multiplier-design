// 8-bit approximate multiplier as per given block diagram
module AM8_custom (a,b,y);
    input  [7:0] a;
    input  [7:0] b;
    output [15:0] y;
    wire [3:0] aL = a[3:0];
    wire [3:0] aH = a[7:4];
    wire [3:0] bL = b[3:0];
    wire [3:0] bH = b[7:4];

    // Partial products (8-bit each)
    wire [7:0] pLL, pLH, pHL, pHH;

    // Bottom-right block: OR-based 4×4
    AM4_OR mul_LL(.a(aL), .b(bL), .y(pLL));

    // Bottom-left block: AM4_T4
    AM4_T4 mul_HL(.a(aH), .b(bL), .y(pHL));

    // Top-right block: AM4_T4
    AM4_T4 mul_LH(.a(aL), .b(bH), .y(pLH));

    // Top-left block: exact 4×4
    exact_mul4 mul_HH(.a(aH), .b(bH), .y(pHH));
    assign y[3:0] = pLL[3:0];
    assign y[7:4] = pLL[7:4]|pHL[3:0]|pLH[3:0];
    wire [3:0] x;
    assign x = pHL[7:4] + pLH[7:4];
    // Align partial products
    wire [7:0] partHH = {4'b0, x};           // adding zeros
    // Final exact adder tree
    assign y [15:8] = pHH + partHH;
endmodule
