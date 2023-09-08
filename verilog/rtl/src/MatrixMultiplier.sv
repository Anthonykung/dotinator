`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Anthony Kung
//
// Create Date: 09/07/2023 16:38:49
// Design Name: MatrixMultiplier
// Module Name: MatrixMultiplier
// Project Name: dotinator
// Description: Description Currently Unavailable
//
// Dependencies: none
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module MatrixMultiplier #(
  parameter N_ROWS = 4, // Number of rows in matrix A
  parameter N_COLS = 4, // Number of columns in matrix A and rows in matrix B
  parameter M_COLS = 4, // Number of columns in matrix B
  parameter DATA_WIDTH = 32 // Width of the data
)(
  input logic [DATA_WIDTH-1:0] memA[N_ROWS][N_COLS], // Input matrix A
  input logic [DATA_WIDTH-1:0] memB[N_COLS][M_COLS], // Input matrix B
  output logic [DATA_WIDTH-1:0] memR[N_ROWS][M_COLS]  // Output matrix R
);

  // Invert the matrix B
  logic [DATA_WIDTH-1:0] memB_inverted[M_COLS][N_COLS];

  InvertArray #(
    .ROW_SIZE(N_COLS),
    .COL_SIZE(M_COLS),
    .DATA_WIDTH(DATA_WIDTH)
  ) invert (
    .original_array(memB),
    .inverted_array(memB_inverted)
  );

  generate
    genvar i, j;

    for (i = 0; i < N_ROWS; i++) begin : row_gen
      for (j = 0; j < M_COLS; j++) begin : col_gen
        Multiplier #(
          .N_ROWS(N_ROWS),
          .N_COLS(N_COLS),
          .M_COLS(M_COLS)
        ) multiplier (
          .memA(memA[i]),
          .memB(memB_inverted[j]),
          .memR(memR[i][j])
        );
      end
    end
  endgenerate

endmodule
