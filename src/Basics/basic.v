module moduleName (input clk,A,B,output C);
    wire w;  //wire declaration
    reg r;  //reg declaration
     assign w=A&B;  //wire continuous assignment
     always @(posedge clk) begin 
        r=A;  //reg procedural assignment 
     end
endmodule


//module for four bit adder operation
module moduleName (
    input [3:0] A,[3:0] B,output [3:0] Sum,output Cout
);
assign {Cout,Sum}=A+B;
endmodule


//There are different types of assignments in verilog
 1. Continuous Assignment i.e assign a=b&c
 2. Procedural Assignment i.e using always and initial blocks


 //Modelling in verilog
 
 1. Gate Level Description
 //model the design using logical gates like AND, OR and NOT,
 //This is closely mimicking hardware components
 
 //example

 module moduleName (
    input a, b,c,output y
 );
    wire and1,and2;
    and(and1,a,b);
    and(and2,a,c);
    or(y,and1,and2);
 endmodule


2. DataFlow Description

