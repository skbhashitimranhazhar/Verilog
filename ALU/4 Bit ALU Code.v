module alu_4bit(a, b, sel, result, cout);
input [3:0] a, b;
input [2:0] sel;
output reg [3:0] result;
output reg cout;
wire [3:0] b_mod;
wire c1, c2, c3, c4;
wire [3:0] sum;
wire add_sub_cout;
assign b_mod[0] = b[0] ^ sel[0];
assign b_mod[1] = b[1] ^ sel[0];
assign b_mod[2] = b[2] ^ sel[0];
assign b_mod[3] = b[3] ^ sel[0];
assign sum[0] = a[0] ^ b_mod[0] ^ sel[0];
assign c1 = (a[0] & b_mod[0]) | (a[0] & sel[0]) | (b_mod[0] & sel[0]);
assign sum[1] = a[1] ^ b_mod[1] ^ c1;
assign c2 = (a[1] & b_mod[1]) | (a[1] & c1) | (b_mod[1] & c1);
assign sum[2] = a[2] ^ b_mod[2] ^ c2;
assign c3 = (a[2] & b_mod[2]) | (a[2] & c2) | (b_mod[2] & c2);
assign sum[3] = a[3] ^ b_mod[3] ^ c3;
assign add_sub_cout = (a[3] & b_mod[3]) | (a[3] & c3) | (b_mod[3] & c3);
wire [3:0] and_out = a & b;
wire [3:0] or_out  = a | b;
wire [3:0] xor_out = a ^ b;
wire [3:0] not_out = ~a;
wire [3:0] inc_out = a + 4'b0001;
wire [3:0] dec_out = a - 4'b0001;
always @(*) begin
    case (sel)
        3'b000: begin result = sum;    cout = add_sub_cout; end // ADD
        3'b001: begin result = sum;    cout = add_sub_cout; end // SUB
        3'b010: begin result = and_out; cout = 0; end
        3'b011: begin result = or_out;  cout = 0; end
        3'b100: begin result = xor_out; cout = 0; end
        3'b101: begin result = not_out; cout = 0; end
        3'b110: begin result = inc_out; cout = 0; end
        3'b111: begin result = dec_out; cout = 0; end
        default: begin result = 4'b0000; cout = 0; end
    endcase
end
endmodule
