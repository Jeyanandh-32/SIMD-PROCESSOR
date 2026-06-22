module multiplier (
    input [31:0] in1,
    input [31:0] in2,
    input D,
    input H,
    input O,
    input Q,
    output reg [31:0] out
);

    always @(*) begin
        out = 32'b0;

        if (D) out = in1 * in2;

        else if (H) begin
            out[15:0]  = in1[15:0] * in2[15:0];
            out[31:16] = in1[31:16] * in2[31:16];
        end else if (O) begin
            out[7:0]   = in1[7:0] * in2[7:0];
            out[15:8]  = in1[15:8] * in2[15:8];
            out[23:16] = in1[23:16] * in2[23:16];
            out[31:24] = in1[31:24] * in2[31:24];
        end else if (Q) begin
            out[3:0]   = in1[3:0] * in2[3:0];
            out[7:4]   = in1[7:4] * in2[7:4];
            out[11:8]  = in1[11:8] * in2[11:8];
            out[15:12] = in1[15:12] * in2[15:12];
            out[19:16] = in1[19:16] * in2[19:16];
            out[23:20] = in1[23:20] * in2[23:20];
            out[27:24] = in1[27:24] * in2[27:24];
            out[31:28] = in1[31:28] * in2[31:28];
        end
    end

endmodule
