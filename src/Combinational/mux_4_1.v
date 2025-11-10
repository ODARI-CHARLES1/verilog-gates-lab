module mux_4_1 (I0,I1,I2,I3,sel_A,sel_B,y);
    input I0,I1,I2,I3,sel_A,sel_B;
    output y;
    wire and1,and2,and3,and4,not_sel_A,not_sel_B;

    not(not_sel_A,sel_A);
    not(not_sel_B,sel_B);
    and(and1,I0,not_sel_A,not_sel_B);
    and(and2,I1,not_sel_A,sel_B);
    and(and3,I2,sel_A,not_sel_B);
    and(and4,I3,sel_A,sel_B);

    or(y,and1,and2,and3,and4);
endmodule