module or_gate (A,B,y);
    input A,B;
    output y;
    nor(y,A,B);
endmodule