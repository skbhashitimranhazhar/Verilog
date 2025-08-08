module mux2to1 (a,b,sel,out);
input a,b,sel;
output out;
wire w1,w2;
assign w1 = a & ~sel;
assign w2 = b & sel;
assign out = w1 | w2;
endmodule
