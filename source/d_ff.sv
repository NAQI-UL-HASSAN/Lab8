module d_ff(output logic [3:0] q,
            input logic clk, reset, enable,
            input logic [3:0] d
            );

    always_ff @ (posedge clk or posedge reset)
    begin
        if (reset)
            q <= #1 4'b0000;
        else begin
        if (enable)
                q <= #1 d;
                end
    end
endmodule
