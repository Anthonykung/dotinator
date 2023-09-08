`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ON Semiconductor
// Engineer: Anthony Kung
//
// Create Date: 09/07/2023 18:14:54
// Design Name: InvertArray
// Module Name: InvertArray
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

module InvertArray #(
  parameter ROW_SIZE = 4,
  parameter COL_SIZE = 4,
  parameter DATA_WIDTH = 32
) (
  input logic [DATA_WIDTH-1:0] original_array[ROW_SIZE][COL_SIZE],
  output logic [DATA_WIDTH-1:0] inverted_array[COL_SIZE][ROW_SIZE]
);
  // Generate block to invert the array
  genvar row, col;
  generate
    for (row = 0; row < ROW_SIZE; row = row + 1) begin : invert_rows
      for (col = 0; col < COL_SIZE; col = col + 1) begin : invert_cols
        assign inverted_array[col][row] = original_array[row][col];
      end
    end
  endgenerate
endmodule : InvertArray