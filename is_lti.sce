funcprot(0);
//defining LTI system 
function ltisys = lti(p, m, tsam)
    // Check if inputs are real scalars
    if ~isreal(p) | ~isreal(m) | ~isreal(tsam) then
        error("Inputs must be real numbers.");
    end

    // Initialize input and output names as empty strings
    inname = repmat("", m, 1);  // m inputs, initialized with empty strings
    outname = repmat("", p, 1); // p outputs, initialized with empty strings

    // Create the structure for the LTI system
    ltisys = struct("tsam", tsam, ...         // Sample time
                    "inname", inname, ...     // Input names
                    "outname", outname, ...   // Output names
                    "ingroup", struct(), ...  // Grouping for inputs (empty)
                    "outgroup", struct(), ... // Grouping for outputs (empty)
                    "name", "", ...           // System name (empty string)
                    "notes", {{}}, ...        // Notes (empty)
                    "userdata", []);          // User data (empty)

    // Return the created structure
endfunction
// Function to check if the system is an LTI (Linear Time-Invariant) system
function result = is_lti(sys)
    // Check if sys is a structure with 'num' and 'den' fields (LTI system representation)
    if isstruct(sys) & isfield(sys, 'num') & isfield(sys, 'den') then
        result = %T;  // Return true if it is an LTI system
    else
        result = %F;  // Return false if it's not an LTI system
    end
endfunction
