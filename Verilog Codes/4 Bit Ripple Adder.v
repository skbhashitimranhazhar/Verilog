module ripple4bit (a,b,cin,sum, cout);
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;
wire w1,w2,w3;
assign sum[0] = a[0] ^ b[0] ^ cin;
assign w1 = (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin);
assign sum[1] = a[1] ^ b[1] ^ w1;
assign w2 = (a[1] & b[1]) | (a[1] & w1) | (b[1] & w1);
assign sum[2] = a[2] ^ b[2] ^ w2;
assign w3 = (a[2] & b[2]) | (a[2] & w2) | (b[2] & w2);
assign sum[3] = a[3] ^ b[3] ^ w3;
assign cout = (a[3] & b[3]) | (a[3] & w3) | (b[3] & w3);
endmodule
