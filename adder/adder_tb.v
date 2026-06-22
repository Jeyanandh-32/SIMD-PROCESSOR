module adder_tb;
    reg [31:0] A, B;
    reg D, H, O, Q, sub;
    output [31:0] Out;


    adder uut (
        .A  (A),
        .B  (B),
        .sub(sub),
        .D  (D),
        .H  (H),
        .O  (O),
        .Q  (Q),
        .Out(Out)
    );

    initial begin
        $dumpfile("adder_wave.vcd");
        $dumpvars(0, adder_tb);

        $monitor(
            "D = %b | H = %b | O = %b | Q = %b | Sub = %b | A = %h | B = %h | Out = %h",
            D, H, O, Q, sub, A, B, Out);

        D   = 1;
        H   = 0;
        O   = 0;
        Q   = 0;

        sub = 0;

        A   = 32'd100;
        B   = 32'd20;

        #10;

        D = 0;
        H = 1;

        A = 32'h00020003;
        B = 32'h00040005;

        #10;

        H = 0;
        O = 1;

        A = 32'h01020304;
        B = 32'h02020202;

        #10;

        O = 0;
        Q = 1;

        A = 32'h11111111;
        B = 32'h22222222;

        #10;

        Q   = 0;
        D   = 1;
        sub = 1;
        A   = 32'd100;
        B   = 32'd20;

        #10;

        D = 0;
        H = 1;
        A = 32'h0008000F;
        B = 32'h00020003;

        #10;

        H = 0;
        O = 1;
        A = 32'h03040506;
        B = 32'h02020202;

        #10;

        O = 0;
        Q = 1;
        A = 32'h33333333;
        B = 32'h22222222;

        #10;

        $finish;
    end
endmodule
