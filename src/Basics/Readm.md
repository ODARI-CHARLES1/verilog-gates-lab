# Verilog Course Notes



```

modulemoduleName (input clk,A,B,output C);  
  wire w;  //wire declaration  
  reg r;  //reg declaration   
  assign w=A&B;  //wire continuous assignment   
  always @(posedge clk) begin  
      r=A;  //reg procedural assignment  
 endendmodule

```


## module for four bit adder operation

```

modulemoduleName (  
input [3:0] A,[3:0] B,
output [3:0] Sum,output Cout);
assign {Cout,Sum}=A+B;
endmodule

```


## There are different types of assignments in verilog

1. Continuous Assignment i.e assign a=b&c
2. Procedural Assignment i.e using *always* and *initial* blocks

## Modelling in verilog

1. **Gate Level Description**

 model the design using logical gates like AND, OR and NOT,

 This  closely mimicks hardware components

 example

```

 modulemoduleName (    input a, b,c,output y );  
  wire and1,and2;   
  and(and1,a,b);  
  and(and2,a,c);  
  or(y,and1,and2); endmodule

```


2. **DataFlow Description**

Uses assign statements to model the flow of data through the circuit.

Mainly used to describe combinational circuits

It's an intermediate level of abstraction between behavioral and gate-level designs.


```

module MUXto1(
input a,b,sel,
output y
)
//DataFlow description using a conditional expressional

conditional expression
  assign y=(sel===1'bl)?b:a;
 
endmodule

```


## **Behavioral Description**

Describes the functionality of the hardware using a high level approach with **always blocks** and **if-else , case** and other statements.

Used to describe complete circuits (primarily sequential circuits)

```

module MUX2to1(
input a,b,sel,
ouput y
)
 always @(sel or a b ) begin 
   if(sel)
     y=b;
   else 
    y=a;

endmodule


```
