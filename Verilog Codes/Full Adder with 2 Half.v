module FullAdd2 (a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire x,y,z;
assign x = a ^ b;
assign sum = x ^ cin;
assign y = a & b;
assign z = x & cin;
assign cout = y | z;
endmodule
