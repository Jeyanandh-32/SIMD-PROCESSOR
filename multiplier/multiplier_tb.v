module multiplier_tb;
    reg [31:0] in1, in2;
    reg D, H, O, Q;
    wire [31:0] out;

    multiplier uut (
        .in1(in1),
        .in2(in2),
        .D  (D),
        .H  (H),
        .O  (O),
        .Q  (Q),
        .out(out)
    );

    initial begin
        $dumpfile("multiplier_wave.vcd");
        $dumpvars(0, multiplier_tb);

        $monitor(
            "D = %b | H = %b | O = %b | Q = %b | In1 = %h | In2 = %h | Out = %h",
            D, H, O, Q, in1, in2, out);

        D   = 1;
        H   = 0;
        O   = 0;
        Q   = 0;
        in1 = 32'd100;
        in2 = 32'd20;
        #10;

        D   = 0;
        H   = 1;
        in1 = 32'h00020003;
        in2 = 32'h00040005;
        #10;

        H   = 0;
        O   = 1;
        in1 = 32'h01020304;
        in2 = 32'h02020202;
        #10;

        O   = 0;
        Q   = 1;
        in1 = 32'h11111111;
        in2 = 32'h22222222;
        #10;

        $finish;
    end
endmodule
