module AM16_custom (a,b,y);
    input  [15:0] a;
    input  [15:0] b;
    output [31:0] y;
    // Split into high/low 8-bit
    wire [7:0] aL = a[7:0];
    wire [7:0] aH = a[15:8];
    wire [7:0] bL = b[7:0];
    wire [7:0] bH = b[15:8];

    // Partial products
    wire [15:0] pLL, pLH, pHL, pHH;

    // Bottom-right block: approx (8x8)
    AM8_custom mul_LL(.a(aL), .b(bL), .y(pLL));

    // Bottom-left block: approx (8x8)
    AM8_custom mul_LH(.a(aL), .b(bH), .y(pLH));

    // Top-right block: exact (8x8)
    assign pHL = aH * bL; // direct exact

    // Top-left block: exact (8x8)
    assign pHH = aH * bH; // direct exact
    assign y [7:0] = pLL [7:0];
    assign y[15:8] = pLL[15:8]|pLH[7:0]|pHL[7:0];
    assign y[23:16] = pLH[15:8]|pHL[15:8]|pHH[7:0];
    assign y[31:24] = pHH[15:8];
    endmodule
