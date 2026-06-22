module shifter (
    input [31:0] in,
    input D,
    input H,
    input O,
    input Q,
    input left,
    output [31:0] out
);

    wire [30:0] left_shift = in[30:0];
    wire [30:0] right_shift = in[31:1];

    wire [31:0] shift_temp = left ? {left_shift, 1'b0} : {1'b0, right_shift};

    assign out[3:0] = {(left | D | H | O) & shift_temp[3], shift_temp[2:0]};

    assign out[7:4] = {
        (left | D | H) & shift_temp[7],
        shift_temp[6:5],
        (!left | D | H | O) & shift_temp[4]
    };

    assign out[11:8] = {
        (left | D | H | O) & shift_temp[11],
        shift_temp[10:9],
        (!left | D | H) & shift_temp[8]
    };

    assign out[15:12] = {
        (left | D) & shift_temp[15],
        shift_temp[14:13],
        (!left | D | H | O) & shift_temp[12]
    };

    assign out[19:16] = {
        (left | D | H | O) & shift_temp[19],
        shift_temp[18:17],
        (!left | D) & shift_temp[16]
    };

    assign out[23:20] = {
        (left | D | H) & shift_temp[23],
        shift_temp[22:21],
        (!left | D | H | O) & shift_temp[20]
    };

    assign out[27:24] = {
        (left | D | H | O) & shift_temp[27],
        shift_temp[26:25],
        (!left | D | H) & shift_temp[24]
    };

    assign out[31:28] = {
        shift_temp[31:29], (!left | D | H | O) & shift_temp[28]
    };

endmodule
