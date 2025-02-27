# README for `pole` Function

## Description
The `pole` function calculates the poles of a linear time-invariant (LTI) system or a state-space system. Poles are the roots of the denominator polynomial in the transfer function representation or the eigenvalues of the state matrix in state-space representation. This function supports single-input single-output (SISO), multiple-input multiple-output (MIMO), and state-space systems.

## Syntax
```scilab
p = pole(sys)
```

## Parameters
   sys(struct): The system for which poles are to be computed. The structure can represent:
    LTI (Transfer Function) System:
    - `sys.num`: Numerator coefficients of the transfer function.
    - `sys.den`: Denominator coefficients of the transfer function.
    State-Space System:
    - `sys.a`: State matrix of the system.
    - `sys.e` (optional): Descriptor matrix for generalized state-space systems.
    MIMO System:
    - `sys.num`: A cell array containing numerator coefficients for each input-output pair.
    - `sys.den`: A cell array containing denominator coefficients for each input-output pair.

## Returns
  p(vector or matrix):
  - For SISO and state-space systems, `p` is a vector containing the system poles.
  - For MIMO systems, `p` is a matrix where each row corresponds to poles from an individual input-output transfer function.

Examples

#Example 1: SISO System
Input:
sys1 = struct("num", [1], "den", [1, 3, 2]);
poles1 = pole(sys1);
disp("Poles of sys1:");
disp(poles1);

Output:

Poles of sys1:
  -1.
  -2.


#Example 2: State-Space System
Input:

sys2 = struct("a", [1, 2; 3, 4]);
poles2 = pole(sys2);
disp("Poles of sys2:");
disp(poles2);

Output:
Poles of sys2:
   5.3723
  -0.3723


#Example 3: High-Order System
Input:

sys3 = struct("num", [1, 2, 1, 0], "den", [1, 4, 6, 4, 1]);
poles3 = pole(sys3);
disp("Poles of sys3:");
disp(poles3);

Output:

Poles of sys3:
  -2. + 0.i
  -1. + 0.i


#Example 4: MIMO System
Input:
sys4 = struct("num", {{[1], [1, 0]}, {[1, 1], [1]}}, ...
              "den", {{[1, 3, 2], [1, 4, 4]}, {[1, 2], [1, 5, 6]}});
poles4 = pole(sys4);
disp("Poles of sys4:");
disp(poles4);

Output:

Poles of sys4:
  -1.
  -2.
  -2.
  -3.

# Example 5: Discrete-Time System
Input:

sys5 = struct("num", [1, -0.5], "den", [1, -1.5, 0.7]);
poles5 = pole(sys5);
disp("Poles of sys5:");
disp(poles5);

Output:

Poles of the higher-order system:
  -1.0001497 + 0.i       
  -1.        + 0.0001497i
  -1.        - 0.0001497i
  -0.9998503 + 0.i

Challenge in handling calculations of poles of MIMO system:

Numerators and Denominators as Cell Arrays: In a MIMO system, each input-output pair has its own transfer function. Therefore, the numerator (sys.num) and denominator (sys.den) are stored as cell arrays.

Approach:
*Iterate over the cell arrays sys.den and compute the poles for each transfer function using the roots() function.

-Determine the size of sys.den using size().
-Use nested loops to access each element of sys.den 
-Passed the denominator coefficients to roots() to calculate the poles.
-Collect all the poles into a single matrix for display.

Outcome
 "Invalid Index" Error Occurred

 

