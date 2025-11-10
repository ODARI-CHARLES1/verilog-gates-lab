`timescale 1ns / 1ps

module mux_4_1_tb;
  reg sel_A, sel_B;
  reg I0, I1, I2, I3;
  wire y;

  // Instantiate DUT (Design Under Test)
  mux_4_1 u_mux (
    .sel_A(sel_A),
    .sel_B(sel_B),
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .y(y)
  );

  // Dump waveforms
  initial begin
    $dumpfile("waveforms/mux_waveforms.vcd");
    $dumpvars(0, mux_4_1_tb);

    $display("Time\tSel_A\tSel_B\tI0\tI1\tI2\tI3\ty");
    $display("------------------------------------------------------");

    // Apply stimulus
    I0 = 0; I1 = 1; I2 = 0; I3 = 1;

    sel_A = 0; sel_B = 0; #10; display_values();
    sel_A = 0; sel_B = 1; #10; display_values();
    sel_A = 1; sel_B = 0; #10; display_values();
    sel_A = 1; sel_B = 1; #10; display_values();

    $display("Simulation finished.");
    $finish;
  end

  // Task to display signal values neatly
  task display_values;
    begin
      $display("%0dns\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
               $time, sel_A, sel_B, I0, I1, I2, I3, y);
    end
  endtask

endmodule
