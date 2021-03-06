function [x, err, steps] = jacobi_matrix(A, b, x0, tol, max_steps)
  N = diag(diag(A));
  P = N - A;
  inv_N = diag(1 ./ diag(N));
  G = inv_N * P;
  c = inv_N * b;
  prev_x = x0;
  steps = 0;
  while 1
    x = G * prev_x + c;
    err = norm(x - prev_x);
    if ++steps == max_steps || err < tol
      return;
    endif
    prev_x = x;
  endwhile
endfunction
