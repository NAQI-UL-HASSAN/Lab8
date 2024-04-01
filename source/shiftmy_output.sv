module shiftmy_output(input logic clk, reset, direction,
                      input logic [3:0] q0, q1, q2, q3, q4, q5, q6, q7, q8,
                      output logic [3:0] y, 
                      output logic [2:0] x
                     );
logic clk100hz, clk1hz;
//100 HZ CLOCK
    clk100hz X (
        .clk(clk),
        .reset(reset),
        .clk100hz(clk100hz)
    );

//1 HZ CLOCK
    clk1hz Y (
        .clk(clk),
        .reset(reset),
        .clk1hz(clk1hz)
    );

//ADDERS

    //WIRES FOR COUNTER FLIPFLOPS
    logic [2:0] ff0_q, ff0_d, ff1_q, ff1_d, ff2_q, ff2_d, ff3_q, ff3_d, ff4_q, ff4_d, ff5_q, ff5_d;
    logic [2:0] ff6_q, ff6_d, ff7_q, ff7_d, ff8_q, ff8_d, ff9_q, ff9_d;
    logic [2:0] ff10_q, ff10_d, ff11_q, ff11_d, ff12_q, ff12_d, ff13_q, ff13_d, ff14_q, ff14_d, ff15_q, ff15_d;

    //Counters
    always_comb ff0_d = 3'd0;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff0_q <= #1 3'd0;
        end
        else begin
            ff0_q <= #1 ff0_d;
        end
    end
    
    always_comb ff1_d = ff1_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff1_q <= #1 3'd0;
        end
        else begin
            if (ff1_q == 3'd1) begin
                ff1_q <= #1 3'd0; end
            else begin
                ff1_q <= #1 ff1_d; end
        end
    end

    always_comb ff2_d = ff2_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff2_q <= #1 3'd0;
        end
        else begin
            if (ff2_q == 3'd2) begin
                ff2_q <= #1 3'd0; end
            else begin
                ff2_q <= #1 ff2_d; end
        end
    end

    always_comb ff3_d = ff3_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff3_q <= #1 3'd0;
        end
        else begin
            if (ff3_q == 3'd3) begin
                ff3_q <= #1 3'd0; end
            else begin
                ff3_q <= #1 ff3_d; end
        end
    end

    always_comb ff4_d = ff4_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff4_q <= #1 3'd0;
        end
        else begin
            if (ff4_q == 3'd4) begin
                ff4_q <= #1 3'd0; end
            else begin
                ff4_q <= #1 ff4_d; end
        end
    end

    always_comb ff5_d = ff5_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff5_q <= #1 3'd0;
        end
        else begin
            if (ff5_q == 3'd5) begin
                ff5_q <= #1 3'd0; end
            else begin
                ff5_q <= #1 ff5_d; end
        end
    end

    always_comb ff6_d = ff6_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff6_q <= #1 3'd0;
        end
        else begin
            if (ff6_q == 3'd6) begin
                ff6_q <= #1 3'd0; end
            else begin
                ff6_q <= #1 ff6_d; end
        end
    end

    always_comb ff7_d = ff7_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff7_q <= #1 3'd0;
        end
        else begin
            ff7_q <= #1 ff7_d; end
    end

    always_comb ff8_d = ff8_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff8_q <= #1 3'd0;
        end
        else begin
            ff8_q <= #1 ff8_d; end
    end

    always_comb ff9_d = ff9_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff9_q <= #1 3'd1;
        end
        else begin
            if (ff9_q == 3'd7) begin
                ff9_q <= #1 3'd1; end
            else begin
                ff9_q <= #1 ff9_d; end
        end
    end

    always_comb ff10_d = ff10_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff10_q <= #1 3'd2;
        end
        else begin
            if (ff10_q == 3'd7) begin
                ff10_q <= #1 3'd2; end
            else begin
                ff10_q <= #1 ff10_d; end
        end
    end

    always_comb ff11_d = ff11_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff11_q <= #1 3'd3;
        end
        else begin
            if (ff11_q == 3'd7) begin
                ff11_q <= #1 3'd3; end
            else begin
                ff11_q <= #1 ff11_d; end
        end
    end

    always_comb ff12_d = ff12_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff12_q <= #1 3'd4;
        end
        else begin
            if (ff12_q == 3'd7) begin
                ff12_q <= #1 3'd4; end
            else begin
                ff12_q <= #1 ff12_d; end
        end
    end

    always_comb ff13_d = ff13_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff13_q <= #1 3'd5;
        end
        else begin
            if (ff13_q == 3'd7) begin
                ff13_q <= #1 3'd5; end
            else begin
                ff13_q <= #1 ff13_d; end
        end
    end

    always_comb ff14_d = ff14_q + 1;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff14_q <= #1 3'd6;
        end
        else begin
            if (ff14_q == 3'd7) begin
                ff14_q <= #1 3'd6; end
            else begin
                ff14_q <= #1 ff14_d; end
        end
    end

    always_comb ff15_d = 3'd7;
    always_ff@(posedge clk100hz or posedge reset)
    begin
        if (reset) begin
            ff15_q <= #1 3'd7;
        end
        else begin
            ff15_q <= #1 ff15_d;
        end
    end

//MUXs

    //Mux connections
    logic [3:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;

    //Different combinations of Stored inputs
    always_comb begin
        case(ff0_q)
            3'b000: m0 = q0;
            default: m0 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff1_q)
            3'b000: m1 = q1;
            3'b001: m1 = q0;
            default: m1 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff2_q)
            3'b000: m2 = q2;
            3'b001: m2 = q1;
            3'b010: m2 = q0;
            default: m2 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff3_q)
            3'b000: m3 = q3;
            3'b001: m3 = q2;
            3'b010: m3 = q1;
            3'b011: m3 = q0;
            default: m3 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff4_q)
            3'b000: m4 = q4;
            3'b001: m4 = q3;
            3'b010: m4 = q2;
            3'b011: m4 = q1;
            3'b100: m4 = q0;
            default: m4 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff5_q)
            3'b000: m5 = q5;
            3'b001: m5 = q4;
            3'b010: m5 = q3;
            3'b011: m5 = q2;
            3'b100: m5 = q1;
            3'b101: m5 = q0;
            default: m5 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff6_q)
            3'b000: m6 = q6;
            3'b001: m6 = q5;
            3'b010: m6 = q4;
            3'b011: m6 = q3;
            3'b100: m6 = q2;
            3'b101: m6 = q1;
            3'b110: m6 = q0;
            default: m6 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff7_q)
            3'b000: m7 = q7;
            3'b001: m7 = q6;
            3'b010: m7 = q5;
            3'b011: m7 = q4;
            3'b100: m7 = q3;
            3'b101: m7 = q2;
            3'b110: m7 = q1;
            3'b111: m7 = q0;
            default: m7 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff8_q)
            3'b000: m8 = q8;
            3'b001: m8 = q7;
            3'b010: m8 = q6;
            3'b011: m8 = q5;
            3'b100: m8 = q4;
            3'b101: m8 = q3;
            3'b110: m8 = q2;
            3'b111: m8 = q1;
            default: m8 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff9_q)
            3'b001: m9 = q8;
            3'b010: m9 = q7;
            3'b011: m9 = q6;
            3'b100: m9 = q5;
            3'b101: m9 = q4;
            3'b110: m9 = q3;
            3'b111: m9 = q2;
            default: m9 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff10_q)
            3'b010: m10 = q8;
            3'b011: m10 = q7;
            3'b100: m10 = q6;
            3'b101: m10 = q5;
            3'b110: m10 = q4;
            3'b111: m10 = q3;
            default: m10 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff11_q)
            3'b011: m11 = q8;
            3'b100: m11 = q7;
            3'b101: m11 = q6;
            3'b110: m11 = q5;
            3'b111: m11 = q4;
            default: m11 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff12_q)
            3'b100: m12 = q8;
            3'b101: m12 = q7;
            3'b110: m12 = q6;
            3'b111: m12 = q5;
            default: m12 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff13_q)
            3'b101: m13 = q8;
            3'b110: m13 = q7;
            3'b111: m13 = q6;
            default: m13 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff14_q)
            3'b110: m14 = q8;
            3'b111: m14 = q7;
            default: m14 = 4'bxxxx;
        endcase
    end

    always_comb begin
        case(ff15_q)
            3'b111: m15 = q8;
            default: m15 = 4'bxxxx;
        endcase
    end

//INCREASING COUNTER

    //Adder wires
    logic [3:0] counter_d, counter_q;

    always_comb counter_d = counter_q + 1;
    always_ff@(posedge clk1hz or posedge reset)
    begin
        if (reset) begin
            counter_q <= #1 4'd0;
        end
        else begin
            counter_q <= #1 counter_d; end
    end

//DECREASING COUNTER

    //Subtractor wires
    logic [3:0] sub_d, sub_q;

    always_comb sub_d = sub_q - 1;
    always_ff@(posedge clk1hz or posedge reset)
    begin
        if (reset) begin
            sub_q <= #1 4'd15;
        end
        else begin
            if (sub_q == 4'd0) begin
                sub_q <= #1 4'd15; end
            else begin
                sub_q <= #1 sub_d; end 
        end
    end

//MUX FOR DIRECTION
    logic [3:0] s;
    always_comb begin
        if (direction) s = sub_q;
        else s = counter_q;
    end

//MUX FOR CATHODE CHANGE
    always_comb begin
        case(s)
            4'b0000:y = m0;
            4'b0001:y = m1;
            4'b0010:y = m2;
            4'b0011:y = m3;
            4'b0100:y = m4;
            4'b0101:y = m5;
            4'b0110:y = m6;
            4'b0111:y = m7;
            4'b1000:y = m8;
            4'b1001:y = m9;
            4'b1010:y = m10;
            4'b1011:y = m11;
            4'b1100:y = m12;
            4'b1101:y = m13;
            4'b1110:y = m14;
            4'b1111:y = m15;
            default: y = 4'bxxxx;
        endcase
    end 

//MUX FOR ANODE CHANGE
    always_comb begin
        case(s)
            4'b0000:x = ff0_q;
            4'b0001:x = ff1_q;
            4'b0010:x = ff2_q;
            4'b0011:x = ff3_q;
            4'b0100:x = ff4_q;
            4'b0101:x = ff5_q;
            4'b0110:x = ff6_q;
            4'b0111:x = ff7_q;
            4'b1000:x = ff8_q;
            4'b1001:x = ff9_q;
            4'b1010:x = ff10_q;
            4'b1011:x = ff11_q;
            4'b1100:x = ff12_q;
            4'b1101:x = ff13_q;
            4'b1110:x = ff14_q;
            4'b1111:x = ff15_q;
            default: x = 3'bxxx;
        endcase
    end 

endmodule