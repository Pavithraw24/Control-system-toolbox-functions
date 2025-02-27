funcprot(0);
function mag = db2mag(db)
  // Check if the input is valid (real matrix)
  if argn(0) <> 1 | ~ismatrix(db) then
    error('Usage: db2mag(db) where db is a real matrix');
  end

  // Convert decibels to magnitude
  mag = 10 .^ (db / 20);
endfunction

// Example usage
db = [0, 20, 40, %inf];  // Decibels
mag = db2mag(db);
disp(mag);
db = 20;  // Decibels
mag = db2mag(db);
disp(mag);
db = [0, 20; 40, -20];  // Decibels in a 2x2 matrix
mag = db2mag(db);
disp(mag);
db = "20";  // Invalid input (string instead of matrix)
mag = db2mag(db);
