% La funcion matrices recibe como parametros dos matrices p y t y devuelve
% como resultado la matriz de masa A y la matriz de rigidez B del problema
% (que se obtienen calculando las respectivas matrices locales). Las
% matrices p y t estan relacionadas con los datos de la triangulacion.

function [A, B] = matrices(p, t)
  maximo = max(max(t));
  A = sparse(maximo, maximo);
  B = sparse(maximo, maximo);
  for i = 1:size(t, 1)
    [At, Bt] = matrizElem(p(t(i, 1), :), p(t(i, 2), :), p(t(i, 3), :));
    A(t(i, :), t(i, :)) = A(t(i, :), t(i, :)) + At; 
    B(t(i, :), t(i, :)) = B(t(i, :), t(i, :)) + Bt;
  end
end 