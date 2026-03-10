clear all;

% Parameters
a = [0 22 22 12];
al = [pi/2 0 0 0];
d = [0 0 0 0];
theeta = [0 pi/2 0 0];

% Links
L(1) = Link([theeta(1) d(1) a(1) al(1)]);
L(2) = Link([theeta(2) d(2) a(2) al(2)]);
L(3) = Link([theeta(3) d(3) a(3) al(3)]);
L(4) = Link([theeta(4) d(4) a(4) al(4)]);

% Leg 1
L1 = SerialLink(L);
L1.name="Leg1";
L1.base=transl(30,-20,0);
L1.fkine([theeta(1) theeta(2) theeta(3) theeta(4)])

% Leg 2
L2 = SerialLink(L);
L2.name="Leg2";
L2.base=transl(0,-20,0);
L2.fkine([theeta(1) theeta(2) theeta(3) theeta(4)]);

% Leg 3
L3 = SerialLink(L);
L3.name="Leg3";
L3.base=transl(-30,-20,0);
L3.fkine([theeta(1) theeta(2) theeta(3) theeta(4)]);

% Leg 4
L4 = SerialLink(L);
L4.name="Leg4";
L4.base=transl(30,20,0);
L4.fkine([theeta(1) theeta(2) theeta(3) theeta(4)]);

% Leg 5
L5 = SerialLink(L);
L5.name="Leg5";
L5.base=transl(0,20,0);
L5.fkine([theeta(1) theeta(2) theeta(3) theeta(4)]);

% Leg 6
L6 = SerialLink(L);
L6.name="Leg6";
L6.base=transl(-30,20,0);
L6.fkine([theeta(1) theeta(2) theeta(3) theeta(4)]);

% Base
base_vertices = [
    -30, -20, 0;  % Bottom-left
    30, -20, 0;   % Bottom-right
    30, 20, 0;    % Top-right
    -30, 20, 0;   % Top-left
];

base_faces = [1, 2, 3, 4];

patch('Vertices', base_vertices, 'Faces', base_faces, ...
      'FaceColor', [1 1 1], 'FaceAlpha', 1, ...
      'EdgeColor', 'k', 'LineWidth', 1.5);

% Plotting
hold on
title("Hexapod")

xlim([-80 80]);
ylim([-80 80]);
zlim([-60 10]);

L1.plot([-pi/4,-pi/4,-pi/4,-pi/4]);
L2.plot([-pi/2,-pi/4,-pi/4,-pi/4]);
L3.plot([-pi/1.44,-pi/4,-pi/4,-pi/4]);
L4.plot([pi/4,-pi/4,-pi/4,-pi/4]);
L5.plot([pi/2,-pi/4,-pi/4,-pi/4]);
L6.plot([pi/1.44,-pi/4,-pi/4,-pi/4]);

