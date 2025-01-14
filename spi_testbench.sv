
`timescale 1ns / 1ps

module spi_tb;

  // Inputs
  reg clk;
  reg newd;
  reg rst;
  reg [11:0] din;

  // Outputs
  wire cs;
  wire mosi;
  wire sclk;

  // Instantiate the SPI module
  spi uut (
    .clk(clk),
    .newd(newd),
    .rst(rst),
    .din(din),
    .cs(cs),
    .mosi(mosi),
    .sclk(sclk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz clock
  end

  // Testbench stimulus
  initial begin
    // Initialize inputs
    rst = 1;
    newd = 0;
    din = 12'b0;
    
    // Reset the SPI module
    #10 rst = 0;

    // Test case 1: Send data
    #10 din = 12'b110101011001; // Example data
    newd = 1;
    #10 newd = 0; // De-assert `newd` after one clock cycle
    
    // Wait for the SPI transaction to complete
    #200;
    
    // Test case 2: Send another data
    din = 12'b101010101010; // Another example data
    newd = 1;
    #10 newd = 0;

    // Wait for the transaction to complete
    #200;

    // End simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | rst=%b | newd=%b | din=%b | cs=%b | mosi=%b | sclk=%b",
             $time, rst, newd, din, cs, mosi, sclk);
  end

endmodule
