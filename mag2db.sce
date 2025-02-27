 function db = mag2db(mag)
  // Check if the input is valid (real or complex matrix)
  if argn(0) <> 1 | ~ismatrix(mag) then
    error('Usage: mag2db(mag) where mag is a real or complex matrix');
  end

  // Handle negative real magnitudes (only real numbers) by setting them to NaN
  mag(real(mag) < 0 & imag(mag) == 0) = %nan;  // Only for real negative values

  // Take the magnitude of complex numbers (this includes both real and imaginary parts)
  mag = abs(mag); // Get the absolute value of complex numbers

  // Convert magnitude to decibels
  db = 20 * log10(mag);
endfunction
mag = [1, 10, 100];
db = mag2db(mag);
disp(db);
mag = [1 + %i, -10, 100, -3 + 4*%i];  // Complex numbers with negative real parts
db = mag2db(mag);
disp(db);
