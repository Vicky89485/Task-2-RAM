// ============================
// RAM Design and Testbench (Single File for GitHub or PDF)
// ============================

module RAM (
    input clk,
    input we,            // Write Enable
    input [3:0] addr,    // 4-bit address (16 locations)
    input [7:0] din,     // Data input
    output reg [7:0] dout // Data output
);

reg [7:0] mem [0:15];  // 16 x 8-bit memory

always @(posedge clk) begin
    if (we)
        mem[addr] <= din;    // Write operation
    dout <= mem[addr];       // Read operation
end

endmodule


module RAM_tb;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

RAM uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, RAM_tb);

    clk = 0;
    we = 0;
    addr = 0;
    din = 0;

    // Write data 8'hAA to addr 2
    #5 addr = 4'd2; din = 8'hAA; we = 1;
    #10 we = 0;

    // Write data 8'h55 to addr 5
    #5 addr = 4'd5; din = 8'h55; we = 1;
    #10 we = 0;

    // Read addr 2
    #5 addr = 4'd2; we = 0;

    // Read addr 5
    #10 addr = 4'd5; we = 0;

    #20 $finish;
end

// Clock generation
always #5 clk = ~clk;

endmodule
