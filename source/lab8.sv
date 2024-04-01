module lab8 (input logic [3:0] num, 
             input [3:0] sel,
             input logic write, reset, clk, direction,
             output logic an0, an1, an2, an3, an4, an5, an6, an7,
             output logic segA, segB, segC, segD, segE, segF, segG
             );
//SOME WIRES
    logic en0, en1, en2, en3, en4, en5, en6, en7, en8;
    logic [3:0] q0, q1, q2, q3, q4, q5, q6, q7, q8;
    logic [4:0] wi_re;
    logic [8:0] w_ire;
    logic [3:0] y, x, z, l;
    logic clk1hz, clk100hz;
    

//DECODER FOR DFF SELECTION
    always_comb
    begin
        wi_re[4] = write;
        wi_re[3] = sel[3];
        wi_re[2] = sel[2];
        wi_re[1] = sel[1];
        wi_re[0] = sel[0];
    end
    always_comb
    begin
        en0 = w_ire[8];
        en1 = w_ire[7];
        en2 = w_ire[6];
        en3 = w_ire[5];
        en4 = w_ire[4];
        en5 = w_ire[3];
        en6 = w_ire[2];
        en7 = w_ire[1];
        en8 = w_ire[0];
    end
    always_comb begin
        case(wi_re)
            5'b0xxxx: w_ire = 9'b000000000;
            5'b10000: w_ire = 9'b100000000;
            5'b10001: w_ire = 9'b010000000;
            5'b10010: w_ire = 9'b001000000;
            5'b10011: w_ire = 9'b000100000;
            5'b10100: w_ire = 9'b000010000;
            5'b10101: w_ire = 9'b000001000;
            5'b10110: w_ire = 9'b000000100;
            5'b10111: w_ire = 9'b000000010;
            5'b11000: w_ire = 9'b000000001;
            default: w_ire = 9'bxxxxxxxxx;
        endcase
    end

//100 HZ CLOCK
    clk100hz DUT1 (
        .clk(clk),
        .reset(reset),
        .clk100hz(clk100hz)
    );

//1 HZ CLOCK
    clk1hz DUT2 (
        .clk(clk),
        .reset(reset),
        .clk1hz(clk1hz)
    );

//D_FFs
    d_ff ff0 (
        .q (q0),
        .clk (clk100hz),
        .reset (reset),
        .enable (en0),
        .d (num)
    );
    d_ff ff1 (
        .q (q1),
        .clk (clk100hz),
        .reset (reset),
        .enable (en1),
        .d (num)
    );
    d_ff ff2 (
        .q (q2),
        .clk (clk100hz),
        .reset (reset),
        .enable (en2),
        .d (num)
    );
    d_ff ff3 (
        .q (q3),
        .clk (clk100hz),
        .reset (reset),
        .enable (en3),
        .d (num)
    );
    d_ff ff4 (
        .q (q4),
        .clk (clk100hz),
        .reset (reset),
        .enable (en4),
        .d (num)
    );
    d_ff ff5 (
        .q (q5),
        .clk (clk100hz),
        .reset (reset),
        .enable (en5),
        .d (num)
    );
    d_ff ff6 (
        .q (q6),
        .clk (clk100hz),
        .reset (reset),
        .enable (en6),
        .d (num)
    );
    d_ff ff7 (
        .q (q7),
        .clk (clk100hz),
        .reset (reset),
        .enable (en7),
        .d (num)
    );
    d_ff ff8 (
        .q (q8),
        .clk (clk100hz),
        .reset (reset),
        .enable (en8),
        .d (num)
    );

//SHIFTING THE OUTPUT
    shiftmy_output X (
        .clk(clk),
        .reset(reset),
        .direction(direction),
        .y(y),
        .x(x),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3),
        .q4(q4),
        .q5(q5),
        .q6(q6),
        .q7(q7),
        .q8(q8)
    );

//NUM MUX
always_comb begin
    case (sel)
        4'b0000:z = q0;
        4'b0001:z = q1;
        4'b0010:z = q2;
        4'b0011:z = q3;
        4'b0100:z = q4;
        4'b0101:z = q5;
        4'b0110:z = q6;
        4'b0111:z = q7;
        4'b1000:z = q8;
        default: z = 4'bxxxx;
    endcase
end

//MUX FINAL

    always_comb begin
        case(write)
            1'b0 : l = y;
            1'b1 : l = z;
        endcase
    end

//MUX1
    logic [2:0] d;
    logic [2:0] mu_x;
    always_comb begin
        mu_x[2] = sel[2];
        mu_x[1] = sel[1];
        mu_x[0] = sel[0];
    end
    always_comb begin
        if (write) d = mu_x;
        else d = x;
    end

//DECODER FOR CATHODE
    logic [6:0] cath;
    always_comb
    begin
        segA = cath[6];
        segB = cath[5];
        segC = cath[4];
        segD = cath[3];
        segE = cath[2];
        segF = cath[1];
        segG = cath[0];
    end
    //CASES FOR CATHODE
    always_comb begin
        case (y)
            4'b0000: cath = 7'b0000001;
            4'b0001: cath = 7'b1001111;
            4'b0010: cath = 7'b0010010;
            4'b0011: cath = 7'b0000110;
            4'b0100: cath = 7'b1001100;
            4'b0101: cath = 7'b0100100;
            4'b0110: cath = 7'b0100000;
            4'b0111: cath = 7'b0001111;
            4'b1000: cath = 7'b0000000;
            4'b1001: cath = 7'b0000100;
            4'b1010: cath = 7'b0001000;
            4'b1011: cath = 7'b1100000;
            4'b1100: cath = 7'b0110001;
            4'b1101: cath = 7'b1000010;
            4'b1110: cath = 7'b0110000;
            4'b1111: cath = 7'b0111000;
        endcase
    end

//MUX
    logic [3:0] di_mux;
    always_comb
    begin
        di_mux[3] = direction;
        di_mux[2] = d[2];
        di_mux[1] = d[1];
        di_mux[0] = d[0];
    end

//DECODER FOR ANODE
    logic [7:0] anod;
    always_comb
    begin
        an0 = anod[7];
        an1 = anod[6];
        an2 = anod[5];
        an3 = anod[4];
        an4 = anod[3];
        an5 = anod[2];
        an6 = anod[1];
        an7 = anod[0];
    end
    always_comb begin
        case (d)
            3'b000: anod = 8'b01111111;
            3'b001: anod = 8'b10111111;
            3'b010: anod = 8'b11011111;
            3'b011: anod = 8'b11101111;
            3'b100: anod = 8'b11110111;
            3'b101: anod = 8'b11111011;
            3'b110: anod = 8'b11111101;
            3'b111: anod = 8'b11111110;
            default: anod = 8'bxxxxxxxx;
        endcase
    end

endmodule