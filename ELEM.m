% La funcion ELEM recibe como parametros un paso temporal dt, las matrices
% p y t vinculadas a los datos de la triangulacion, dos funciones u y v y
% el parametro cantIter que indica la cantidad de iteraciones que se van a
% querer hacer. Devuelve dos matrices U y V que representan como va
% evolucionando la solucion a medida que se realizan las iteraciones.

function [U, V] = ELEM(dt, p, t, u, v, cantIter)
  u0 = u(p(:, 1), p(:, 2));
  v0 = v(p(:, 1), p(:, 2));
  [A, B] = matrices(p, t);
  n = max(max(t));
  R = [A + dt * B sparse(n,n); sparse(n,n) A + 10 * dt * B];
  U = [u0];
  V = [v0];
  for i = 1:cantIter
    q = zeros(2*n, 1);
    q(1:n, 1)= A * U(:, i) + dt * 200 * A * (0.1 - U(:, i) + (U(:, i) .^ 2) .* V(:, i));
    q(n+1:2*n, 1) = A * V(:, i) + dt * 200 * A * (1 - (U(:, i) .^ 2) .* V(:, i));
    W = R \ q; 
    U = [U, W(1:n, 1)];
    V = [V, W(n+1:2*n, 1)];
  end
end