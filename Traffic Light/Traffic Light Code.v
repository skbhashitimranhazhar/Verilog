//3 State Moore FSM Traffic Light Controller
module TrafficLight 
(
input clk,
input reset,
output reg red,
output reg yellow,
output reg green
);
parameter S_GREEN = 2'b00;
parameter S_YELLOW = 2'b01;
parameter S_GREEN = 2'b10;
reg[1:0] state;
reg[2:0] count;
always @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
state <= S_GREEN; // start at green
count <= 0;
end else begin
count <= count + 1;
case (state)
S_GREEN:  if (count == 3) begin state <= S_YELLOW; count <= 0; end
S_YELLOW: if (count == 2) begin state <= S_RED;    count <= 0; end
S_RED:    if (count == 4) begin state <= S_GREEN;  count <= 0; end
endcase
end
end
always @(*) begin
red    = (state == S_RED);
yellow = (state == S_YELLOW);
green  = (state == S_GREEN);
end
endmodule 
