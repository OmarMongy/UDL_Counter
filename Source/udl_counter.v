module udl_counter
#(parameter N =4)
(
input clk, reset_n,
input enable,
input up,
input load,
input [N-1:0] L,
output [N-1:0]Q
);
reg [N-1:0]Q_reg, Q_next;        

always @(posedge clk, negedge reset_n)
begin
     if (!reset_n)
     Q_reg <= 'b0;
     else if (enable)
     Q_reg <= Q_next;
     else
     Q_reg <= Q_reg;
end
always @(*)
begin
    Q_next = Q_reg;
    casex ({load,up})
        2'b00 : Q_next = Q_reg - 1; 
        2'b01 : Q_next = Q_reg + 1;
        2'b1x : Q_next = L;
        default : Q_next = Q_reg;
    endcase    
end

assign Q = Q_reg;
endmodule
