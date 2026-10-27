module tb_AM8_custom;

    reg  [7:0] a, b;
    wire [15:0] y_apx, y_exact;

    // DUT: 8-bit approximate multiplier
    AM8_custom1 dut (
        .a(a),
        .b(b),
        .y(y_apx)
    );

    // Exact 8x8 multiplier
    assign y_exact = a * b;

    integer i, j;
    integer errors;

    initial begin
        errors = 0;
        $display("a   b   | Exact   Approx  | Error");
        $display("------------------------------------");

        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                a = i; b = j; #1;
                if (y_apx !== y_exact) begin
                    errors = errors + 1;
                    $display("%3d %3d | %5d  %5d | %d",
                             a, b, y_exact, y_apx, (y_exact - y_apx));
                end
            end
        end

        $display("------------------------------------");
        $display("Simulation completed. Total errors = %d", errors);
        $finish;
    end
endmodule
