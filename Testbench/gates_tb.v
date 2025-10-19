// ----------------------------------------------------------
// General Testbench for Basic Logic Gates
// Author:Odari K. Charles
// Date: 2025-10-19
// Description: 
//   This testbench verifies the behavior of all basic logic gates.
//   It applies all possible input combinations and displays the
//   corresponding outputs for each gate.
// ----------------------------------------------------------

`timescale 1ns / 1ps

module gates_tb;


  reg A;
  reg B;
  wire and_out;
  wire or_out;
  wire not_out;
  wire nand_out;
  wire nor_out;
  wire xor_out;
  wire xnor_out;

  and_gate   u_and   (.A(A), .B(B), .y(and_out));
  or_gate    u_or    (.A(A), .B(B), .y(or_out));
  not_gate   u_not   (.A(A),       .y(not_out));
  nand_gate  u_nand  (.A(A), .B(B), .y(nand_out));
  nor_gate   u_nor   (.A(A), .B(B), .y(nor_out));
  xor_gate   u_xor   (.A(A), .B(B), .y(xor_out));
  xnor_gate  u_xnor  (.A(A), .B(B), .y(xnor_out));
  
  initial begin
    
    $dumpfile("waveforms/gates_waveform.vcd");
    $dumpvars(0, gates_tb);

    $display("Time\tA\tB\tAND\tOR\tNOT\tNAND\tNOR\tXOR\tXNOR");
    $display("------------------------------------------------------------------------------");

    A = 0; B = 0; #10 display_values;
    A = 0; B = 1; #10 display_values;
    A = 1; B = 0; #10 display_values;
    A = 1; B = 1; #10 display_values;
    $finish;
  end

  task display_values;
    begin
      $display("%0dns\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
               $time, A, B, and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
    end
  endtask
 
endmodule
