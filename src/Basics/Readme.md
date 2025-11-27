
# Verilog Course Notes

## Module Structure

```verilog
module moduleName (input clk, A, B, output C);
    wire w;      // wire declaration
    reg r;       // reg declaration
    assign w = A & B;  // wire continuous assignment
    always @(posedge clk) begin
        r = A;   // reg procedural assignment
    end
endmodule
```

## Four Bit Adder Operation

```verilog
module moduleName (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output Cout
);
    assign {Cout, Sum} = A + B;
endmodule
```

## Types of Assignments in Verilog

### 1. Continuous Assignment

- Uses `assign` statement
- Example: `assign a = b & c;`

### 2. Procedural Assignment

- Uses `always` and `initial` blocks

## Modelling in Verilog

### 1. Gate Level Description

- Models design using logical gates (AND, OR, NOT)
- Closely mimics hardware components

```verilog
module moduleName(input a, b, c, output y);
    wire and1, and2;
    and(and1, a, b);
    and(and2, a, c);
    or(y, and1, and2);
endmodule
```

### 2. DataFlow Description

- Uses `assign` statements
- Intermediate level of abstraction
- Mainly for combinational circuits

```verilog
module MUX2to1(
    input a, b, sel,
    output y
);
    // DataFlow description using conditional expression
    assign y = (sel === 1'b1) ? b : a;
endmodule
```

### 3. Behavioral Description

- High-level approach using `always` blocks
- Uses if-else, case statements
- Primarily for sequential circuits

```verilog
module MUX2to1(
    input a, b, sel,
    output reg y
);
    always @(sel or a or b) begin
        if (sel)
            y = b;
        else
            y = a;
    end
endmodule
```

## Sequential Circuit Design

Types of sequential circuits:

- Flip Flops
- Latches
- Counters
- Registers
- Finite State Machines

## Flip Flops

Types include:

- SR Flip Flop
- D Flip Flop
- JK Flip Flop
- T Flip Flop

### D Flip Flop Implementation

**Truth Table:**

| clk     | R | D | q |
| ------- | - | - | - |
| negedge | 0 | x | 0 |
| negedge | 1 | 1 | 1 |
| negedge | 1 | 0 | 0 |

```verilog
module D_FF(
    input clk, reset, d,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end
endmodule
```

## Blocking vs Non-Blocking Assignment

### Blocking Assignment (`=`)

- Executes in series
- Used in combinational circuit design

```verilog
always @(*) begin
    a = b;
    c = a;  // a has already been updated
end
```

### Non-Blocking Assignment (`<=`)

- Executes in parallel
- Used in sequential circuit design

```verilog
always @(posedge clk) begin
    a <= b;
    c <= a;  // a uses previous value
end
```

## Instantiation of Sub Modules

### Basic Instantiation

```verilog
// Sub-module definition
module AND_gate(
    input a, b,
    output y
);
    assign y = a & b;
endmodule

// Top module with instantiation
module top_module(
    input x, y, z,
    output result
);
    wire w1;
  
    // Instance 1: AND_gate
    AND_gate inst1 (
        .a(x),      // Connect port a to signal x
        .b(y),      // Connect port b to signal y
        .y(w1)      // Connect output y to wire w1
    );
  
    // Instance 2: AND_gate
    AND_gate inst2 (
        .a(w1),
        .b(z),
        .y(result)
    );
endmodule
```

### Using Named Port Connections

```verilog
module full_adder(
    input a, b, cin,
    output sum, cout
);
    // Instantiate with named port connections
    half_adder HA1 (
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );
  
    half_adder HA2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .carry(c2)
    );
  
    assign cout = c1 | c2;
endmodule
```

### Array Instantiation Example

```verilog
module ripple_adder(
    input [3:0] A, B,
    input cin,
    output [3:0] Sum,
    output cout
);
    wire [3:0] carry;
  
    // Generate multiple instances
    full_adder FA0 (.a(A[0]), .b(B[0]), .cin(cin), .sum(Sum[0]), .cout(carry[0]));
    full_adder FA1 (.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(Sum[1]), .cout(carry[1]));
    full_adder FA2 (.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(Sum[2]), .cout(carry[2]));
    full_adder FA3 (.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(Sum[3]), .cout(cout));
endmodule
```

### Parameterized Instantiation

```verilog
module parameterized_adder #(parameter WIDTH = 4)(
    input [WIDTH-1:0] A, B,
    output [WIDTH-1:0] Sum
);
    assign Sum = A + B;
endmodule

// Instantiation with parameter override
parameterized_adder #(8) adder8bit (
    .A(data_bus_a),
    .B(data_bus_b),
    .Sum(result)
);
```
