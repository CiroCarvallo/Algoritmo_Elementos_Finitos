% La funcion fbase recibe como parametros tres vectores p1, p2, p3 de
% tamaño 1x2 y un indice i; y devuelve la i-esima funcion de la base nodal
% del espacio de funciones continuas y lineales en el triangulo determinado
% por p1, p2, p3.

function f = fbase(i, p1, p2, p3)
  f = @(x) det(armarMatriz(p1, p2, p3, i, x)) / det(armarMatriz(p1, p2, p3, 3, p3));
end