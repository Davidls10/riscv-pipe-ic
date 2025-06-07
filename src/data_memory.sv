module data_memory #(parameter N = 32, M = 32)
            (input logic clk,
             input logic write_enable,
             input logic [N-1:0] adr,
             input logic [M-1:0] din,
             output logic [M-1:0] dout);

    // reg [M-1:0] mem [2**N-1:0];
    logic [M-1:0] mem [63:0]; // 64 bytes memory

    always_ff @(posedge clk) begin
        if (write_enable) mem[adr] <= din;

        $display("4(x9) = mem[32'h08] = %d", mem[32'h8]);
    end

    assign dout = mem[adr];
endmodule
