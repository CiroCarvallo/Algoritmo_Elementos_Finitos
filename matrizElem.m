% La funcion matrizElem recibe como parametros tres vectores p1, p2, p3 de
% tamaño 1x2 y devuelve la matriz de masa A y la matriz de rigidez B para
% la triangulacion dada por dichos puntos.

function [A, B] = matrizElem(p1, p2, p3)
  area = areaT(p1, p2, p3);
  B1 = [1, 1, 1; p1', p2', p3'];
  B2 = [0, 0; 1, 0; 0, 1];
  B3 = B1 \ B2;
  B = area * B3 * B3';
  A = sparse(3, 3);
  for i = 1:3
    for j = 1:3      
      fi = fbase(i, p1, p2, p3);
      fj = fbase(j, p1, p2, p3);
      A(i, j) = (area / 3) * (fi((p1 + p2) / 2) * fj((p1 + p2) / 2) + fi((p1 + p3) / 2) * fj((p1 + p3) / 2) + fi((p3 + p2) / 2) * fj((p3 + p2) / 2));
    end
  end
end