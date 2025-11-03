// Equivalent gate-level implementation
module mux_2_1(
    input A, B, Sel,
    output y
);
    wire not_sel;
    wire and1, and2;
    
    not(not_sel, Sel);
    and(and1, A, Sel);
    and(and2, B, not_sel);
    or(y, and1, and2);
endmodule