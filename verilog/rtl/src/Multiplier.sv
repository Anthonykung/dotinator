`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ON Semiconductor
// Engineer: Anthony Kung
//
// Create Date: 09/07/2023 18:15:40
// Design Name: Multiplier
// Module Name: Multiplier
// Project Name: dotinator
// Target Devices: xcku115-flva1517-2-e
// Tool Versions: Vivado ML 2021.1
// Description: Description Currently Unavailable
//
// Dependencies: none
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Multiplier #(
  parameter N_ROWS = 4, // Number of rows in matrix A
  parameter N_COLS = 4, // Number of columns in matrix A and rows in matrix B
  parameter M_COLS = 4, // Number of columns in matrix B
  parameter DATA_WIDTH = 32 // Width of the data
)(
  input logic [DATA_WIDTH-1:0] memA[N_COLS], // Input matrix A
  input logic [DATA_WIDTH-1:0] memB[N_COLS], // Input matrix B
  output logic [DATA_WIDTH-1:0] memR  // Output matrix R
);
  always_comb begin : mul_block
    logic [DATA_WIDTH-1:0] temp = 0; // Temporary variable for accumulating the result
    for (int k = 0; k < N_COLS; k++) begin : mul_gen
      temp += memA[k] * memB[k];
    end
    memR = temp; // Store the result in memR
  end
endmodule : Multiplier