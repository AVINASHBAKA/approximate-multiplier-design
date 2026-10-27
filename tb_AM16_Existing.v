module tb_AM16_custom;

    reg  [15:0] a, b;
    wire [31:0] y_apx, y_exact;

    // DUT: 16-bit approximate multiplier
    AM16_custom dut (
        .a(a),
        .b(b),
        .y(y_apx)
    );

    // Exact 16x16 multiplier
    assign y_exact = a * b;

    integer i, j;
    integer errors;

    initial begin
        errors = 0;

        // For large input space (2^32), we’ll test limited patterns
        // exhaustive simulation is too large
        $display("   a       b   | Exact       Approx      | Error");
        $display("-------------------------------------------------");

        for (i = 0; i < 256; i = i + 1) begin   // test 0..255 for a
            for (j = 0; j < 256; j = j + 1) begin // test 0..255 for b
                a = i; b = j; #1;
                if (y_apx !== y_exact) begin
                    errors = errors + 1;
                    $display("%5d  %5d | %10d  %10d | %d",
                             a, b, y_exact, y_apx, (y_exact - y_apx));
                end
            end
        end

        $display("-------------------------------------------------");
        $display("Simulation completed. Total errors = %d", errors);
        $finish;
    end

    // Optional: VCD waveform for GTKWave
    initial begin
        $dumpfile("am16_custom.vcd");
        $dumpvars(0, tb_AM16_custom);
    end

endmodule
