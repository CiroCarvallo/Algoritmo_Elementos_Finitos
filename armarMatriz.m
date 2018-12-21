% La funcion armarMatriz recibe como parametros tres vectores p1, p2, p3
% de tamaño 1x2; un indice i (1 <= i <= 3) y un vector x de tamaño 1x2.  
% Devuelve una matriz de tamaño 3x3 que tiene todos unos en la primer 
% fila, y luego, a partir de la segunda fila en adelante, coloca el vector 
% x en la columna i y los vectores p1, p2 o p3 en las columnas restantes.

function A = armarMatriz(p1, p2, p3, i, x)
  A = sparse(3, 3);
  A(1, :) = [1, 1, 1];
  if (i == 1)
    A(2:3, :) = [x', p2', p3'];
  elseif (i == 2)
    A(2:3, :) = [p1', x', p3'];
  else
    A(2:3, :) = [p1', p2', x'];
  end
end