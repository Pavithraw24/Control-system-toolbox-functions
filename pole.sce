funcprot(0);
 // Function to compute poles of a system (for both LTI and State-Space Systems)
function p = pole(sys)
    // If the system is LTI (transfer function), compute poles from the denominator
    if is_lti(sys) then
        if isempty(sys.den) then
            error("LTI system must have a valid denominator. The denominator field cannot be empty.");
        else
            p = roots(sys.den);  // Use roots to get the poles from the denominator
        end
    // If the system is state-space, compute the eigenvalues (poles) of the state matrix 'a'
    elseif isstruct(sys) & isfield(sys, "a") then
        if issquare(sys.a) then
            p = spec(sys.a);  // Eigenvalues of the system matrix 'a'
        else
            error("pole: state-space matrix must be square.");
        end
    else
        error("pole: argument must be a square matrix or an LTI system");
    end
endfunction

// Example: Define a SISO system (single transfer function)
sys1 = lti(1, 1, 0.1);  // 1 input, 1 output, sample time 0.1
sys1.num = [1];  // Numerator of the transfer function
sys1.den = [1, 1];  // Denominator of the transfer function

// Example: Define a MIMO system (multiple transfer functions)
sys2 = lti(1, 1, 0.2);  // 1 input, 1 output, sample time 0.2
sys2.num = [1];  // Numerator of the transfer function
sys2.den = [1, 2];  // Denominator of the transfer function

// Example: Define a state-space system (sys5)
sys5 = struct("a", [1, 2; 3, 4], "e", []);  // Example state-space system with matrix A

// For SISO system (sys1)
p_siso = pole(sys1);
disp("Poles of the SISO system:");
disp(p_siso);

// For MIMO system (sys2)
p_mimo = pole(sys2);
disp("Poles of the MIMO system:");
disp(p_mimo);

// For state-space system (sys5)
p_state_space = pole(sys5);
disp("Poles of the state-space system:");
disp(p_state_space);

// Other systems for testing
sys1 = struct("num", [1], "den", [1, 3, 2]);  // Transfer function
poles1 = pole(sys1);  // Compute poles
disp("Poles of sys1:");
disp(poles1);

sys2 = struct("num", [1, 2], "den", [1, 6, 11, 6]);  // Transfer function
poles2 = pole(sys2);  // Compute poles
disp("Poles of sys2:");
disp(poles2);

sys3 = struct("a", [1, 2; 3, 4]);  // State-space system
poles3 = pole(sys3);  // Compute poles
disp("Poles of sys3:");
disp(poles3);

sys4 = struct("num", [1, -0.5], "den", [1, -1.5, 0.7]);  // Discrete-time system
poles4 = pole(sys4);  // Compute poles
disp("Poles of sys4:");
disp(poles4);

sys_high_order = struct("num", [1, 2, 1, 0], "den", [1, 4, 6, 4, 1]);  // 4th-order system
poles_high_order = pole(sys_high_order);  // Compute poles
disp("Poles of the higher-order system:");
disp(poles_high_order);

 
