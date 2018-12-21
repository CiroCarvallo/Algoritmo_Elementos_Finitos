% La funcion areaT recibe como parametros tres vectores p1, p2, p3 de
% tamaño 1x2 y devuelve el area del triangulo determinado por dichos
% puntos.

function res = areaT(p1, p2, p3)
  A = armarMatriz(p1, p2, p3, 3, p3);
  res = (1/2) * abs(det(A));
end