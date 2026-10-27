// =====================================================
// Testbench for AM4_T6 and AM4_T7
// =====================================================
module tb_AM4_new;

    reg  [3:0] a, b;
    wire [7:0] y_exact, y6, y7;

    // DUTs
    exact_mul4 u_exact (.a(a), .b(b), .y(y_exact));
    AM4_T6     u6      (.a(a), .b(b), .y(y6));
    AM4_T7     u7      (.a(a), .b(b), .y(y7));

    integer i, j;
    integer errors6, errors7;

    initial begin
        errors6 = 0;
        errors7 = 0;

        $display("a b | Exact | AM4_T6 | Err6 | AM4_T7 | Err7");
        $display("---------------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i; b = j; #1;

                if (y6 !== y_exact) errors6 = errors6 + 1;
                if (y7 !== y_exact) errors7 = errors7 + 1;

                $display("%2d %2d | %3d   | %3d   | %+4d | %3d   | %+4d",
                         a, b, y_exact,
                         y6, $signed(y6) - $signed(y_exact),
                         y7, $signed(y7) - $signed(y_exact));
            end
        end

        $display("---------------------------------------------------");
        $display("Total errors AM4_T6 = %d", errors6);
        $display("Total errors AM4_T7 = %d", errors7);
        $finish;
    end

    // Optional waveform
    initial begin
        $dumpfile("tb_am4_new.vcd");
        $dumpvars(0, tb_AM4_new);
    end
endmodule
