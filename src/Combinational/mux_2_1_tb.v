// ----------------------------------------------------------
// Testbench for 2-to-1 Multiplexer
// Author: Odari K. Charles
// Date: 2025-10-19
// Description: 
//   This testbench verifies the behavior of a 2-to-1 multiplexer.
//   It applies all possible input combinations and displays the
//   corresponding outputs.
// ----------------------------------------------------------

`timescale 1ns / 1ps

module mux_2_1_tb;

  reg A;
  reg B;
  reg Sel;
  wire mux_out;

  // Instantiate the multiplexer
  mux_2_1 u_mux (.A(A), .B(B), .Sel(Sel), .y(mux_out));

  initial begin
    $dumpfile("waveforms/mux_waveform.vcd");
    $dumpvars(0, mux_2_1_tb);

    $display("Time\tSel\tA\tB\tMUX_Out");
    $display("----------------------------------------");

    // Test all input combinations
    Sel = 0; A = 0; B = 0; #10; display_values;
    Sel = 0; A = 0; B = 1; #10; display_values;
    Sel = 0; A = 1; B = 0; #10; display_values;
    Sel = 0; A = 1; B = 1; #10; display_values;
    
    Sel = 1; A = 0; B = 0; #10; display_values;
    Sel = 1; A = 0; B = 1; #10; display_values;
    Sel = 1; A = 1; B = 0; #10; display_values;
    Sel = 1; A = 1; B = 1; #10; display_values;
    
    $finish;
  end

  task display_values;
    begin
      $display("%0dns\t%b\t%b\t%b\t%b",
               $time, Sel, A, B, mux_out);
    end
  endtask
 
endmodule