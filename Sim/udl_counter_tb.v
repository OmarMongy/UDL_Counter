module udl_counter_tb ();
parameter N = 4;

reg clk , reset_n, enable, up, load;
reg [N-1:0] L;
wire [N-1:0] Q;

udl_counter #(.N(N)) uut(
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .up(up),
    .load(load),
    .L(L),
    .Q(Q)
);

localparam T = 20;
always
begin
    clk = 1'b0;
    #(T/2)
    clk = 1'b1;
    #(T/2);
end

initial
begin
load = 1'b0;
L = 4'b1101; 
reset_n = 1'b0;
#T
reset_n = 1'b1;
#T
enable = 1'b1;
up =1'b1;
#(15*T)
load = 1'b1;
#(2*T)
load = 1'b0;
enable = 1'b1;
up = 1'b0;
#(15*T)
enable = 1'b0;
#(50*T)
$stop;
end
endmodule
