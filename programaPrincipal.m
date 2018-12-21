fd = @(p) sqrt(sum(p .^ 2, 2)) - 1;
[p, t] = distmesh2d(fd, @huniform, 0.05, [-1, -1; 1, 1], []);
close all;

% PRIMER CASO

u = @(x, y) x < y;
v = @(x, y) 1 - u(x, y);

[U, V] = ELEM(0.0005, p, t, u, v, 6000);

for j = 1:size(U, 2)
    U(:, j) = U(:, j) > mean(U(:, j));
    V(:, j) = V(:, j) > mean(V(:, j));
end

for i = 1:size(U, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

for i = 1:size(V, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

% SEGUNDO CASO

u = @(x,y) x < 0;
v = @(x,y) 1 - u(x,y);

[U, V] = ELEM(0.0005, p, t, u, v, 6000);

for j = 1:size(U, 2)
    U(:, j) = U(:, j) > mean(U(:, j));
    V(:, j) = V(:, j) > mean(V(:, j));
end

for i = 1:size(U, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

for i = 1:size(V, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

% TERCER CASO

u = @(x,y) x.^2 + y.^2 < 1/4;
v = @(x,y) 1 - u(x,y);

[U, V] = ELEM(0.0005, p, t, u, v, 6000);

for j = 1:size(U, 2)
    U(:, j) = U(:, j) > mean(U(:, j));
    V(:, j) = V(:, j) > mean(V(:, j));
end

for i = 1:size(U, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

for i = 1:size(V, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

% CUARTO CASO

u = @(x,y) (x > 0.25) .* (x < 0.75);
v = @(x,y) 1 - u(x,y);

[U, V] = ELEM(0.0005, p, t, u, v, 6000);

for j = 1:size(U, 2)
    U(:, j) = U(:, j) > mean(U(:, j));
    V(:, j) = V(:, j) > mean(V(:, j));
end

for i = 1:size(U, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end

for i = 1:size(V, 2)
   trimesh(t,p(:,1),p(:,2),U(:,i),'FaceColor','interp');
   view([0, -90]);
   pause(0.01);
end