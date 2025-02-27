// Function to check if the matrix is square
function result = issquare(A)
    // Get the size of the matrix
    [n, m] = size(A);  // n = number of rows, m = number of columns
    
    // Check if the number of rows equals the number of columns
    if n == m then
        result = %T;  // Return true if square
    else
        result = %F;  // Return false if not square
    end
endfunction
