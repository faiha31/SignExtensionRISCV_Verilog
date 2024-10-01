module sign_extension_tb;

  // Inputs
  reg [31:0] IR;
  reg [1:0] ExtendSign;

  // Outputs
  wire [31:0] out;

  // Instantiate the Unit Under Test (UUT)
  sign_extension uut (
    .out(out), 
    .IR(IR), 
    .ExtendSign(ExtendSign)
  );

  // Test sequence
  initial begin
    // Monitor values for debugging
    $monitor("ExtendSign=%b, IR=%h, out=%h", ExtendSign, IR, out);

    // Test imm_i (ExtendSign = 2'b00)
    IR = 32'hFF0000AA;
    ExtendSign = 2'b00;  // imm_i extension
    #10;

    // Test imm_s (ExtendSign = 2'b01)
    IR = 32'hA1234567;
    ExtendSign = 2'b01;  // imm_s extension
    #10;

    // Test imm_b (ExtendSign = 2'b10)
    IR = 32'h12345678;
    ExtendSign = 2'b10;  // imm_b extension
    #10;

    // Test invalid ExtendSign (ExtendSign = 2'b11)
    ExtendSign = 2'b11;  // invalid case
    #10;

    // Finish the simulation
    $finish;
  end

endmodule

