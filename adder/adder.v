module adder (
    input [31:0] A,
    input [31:0] B,
    input sub,
    output [31:0] Out,
    input D,
    input H,
    input O,
    input Q
);

    wire [31:0] B_Real = sub ? ~B : B;

    wire [4:0] Out0 = A[3:0] + B_Real[3:0] + sub;
    wire[4:0] Out1 = A[7:4] + B_Real[7:4] + ((D | H | O) & Out0[4]) + (Q & sub);
    wire[4:0] Out2 = A[11:8] + B_Real[11:8] + ((D | H) & Out1[4]) + ((Q | O) & sub);
    wire[4:0] Out3 = A[15:12] + B_Real[15:12] + ((D | H | O) & Out2[4]) + (Q & sub);
    wire[4:0] Out4 = A[19:16] + B_Real[19:16] + (D & Out3[4]) + ((H | O | Q) & sub);
    wire[4:0] Out5 = A[23:20] + B_Real[23:20] + ((D | H | O) & Out4[4]) + (Q & sub);
    wire[4:0] Out6 = A[27:24] + B_Real[27:24] + ((D | H) & Out5[4]) + ((Q | O) & sub);
    wire[4:0] Out7 = A[31:28] + B_Real[31:28] + ((D | H | O) & Out6[4]) + (Q & sub);

    assign Out = {
        Out7[3:0],
        Out6[3:0],
        Out5[3:0],
        Out4[3:0],
        Out3[3:0],
        Out2[3:0],
        Out1[3:0],
        Out0[3:0]
    };

endmodule
