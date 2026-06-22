module shifter_tb;

    reg [31:0] in;
    reg D, H, O, Q, left;
    wire [31:0] out;

    shifter uut (
        .in(in),
        .D(D),
        .H(H),
        .O(O),
        .Q(Q),
        .left(left),
        .out(out)
    );

    initial begin
        $dumpfile("shifter_wave.vcd");
        $dumpvars(0, shifter_tb);

        $monitor(
            "Left = %b | D = %b | H = %b | O = %b | Q = %b | In = %b | Out = %b",
            left, D, H, O, Q, in, out);

        left = 1;
        D = 1;
        H = 0;
        O = 0;
        Q = 0;

        in = 32'h12345678;

        #10;

        D  = 0;
        H  = 1;
        in = 32'h80008000;

        #10;

        H  = 0;
        O  = 1;
        in = 32'h80808080;

        #10;

        O  = 0;
        Q  = 1;
        in = 32'h88888888;

        #10;

        left = 0;
        D = 1;
        Q = 0;

        in = 32'h2468ACF0;

        #10;

        D  = 0;
        H  = 1;
        in = 32'h00010001;

        #10;

        H  = 0;
        O  = 1;
        in = 32'h01010101;

        #10;

        O  = 0;
        Q  = 1;
        in = 32'h11111111;

        #10;

        $finish;

    end

endmodule
