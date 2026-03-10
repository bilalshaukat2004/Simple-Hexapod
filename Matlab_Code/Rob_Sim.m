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
L1.fkine([theeta(1) theeta(2) theeta(3) theeta(4)]);

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

% Initial and Final Points
L1_0 = [-pi/4,-pi/4,-pi/4,-pi/4];
L1_1 = [0 -pi/4,-pi/4,-pi/4];

L2_0 = [-pi/2,-pi/4,-pi/4,-pi/4];
L2_1 = [-pi/4 -pi/4,-pi/4,-pi/4];

L3_0 = [-pi/1.44,-pi/4,-pi/4,-pi/4];
L3_1 = [-pi/4, -pi/4,-pi/4,-pi/4];

L4_0 = [pi/4,-pi/4,-pi/4,-pi/4];
L4_1 = [0 -pi/4,-pi/4,-pi/4];

L5_0 = [pi/2,-pi/4,-pi/4,-pi/4];
L5_1 = [pi/4, -pi/4,-pi/4,-pi/4];

L6_0 = [pi/1.44,-pi/4,-pi/4,-pi/4];
L6_1 = [pi/2 -pi/4,-pi/4,-pi/4];

% Trajectory
jtrajL1_01 = jtraj(L1_0, L1_1, 5);
jtrajL1_10 = jtraj(L1_1, L1_0, 5);

jtrajL2_01 = jtraj(L2_0, L2_1, 5);
jtrajL2_10 = jtraj(L2_1, L2_0, 5);

jtrajL3_01 = jtraj(L3_0, L3_1, 5);
jtrajL3_10 = jtraj(L3_1, L3_0, 5);

jtrajL4_01 = jtraj(L4_0, L4_1, 5);
jtrajL4_10 = jtraj(L4_1, L4_0, 5);

jtrajL5_01 = jtraj(L5_0, L5_1, 5);
jtrajL5_10 = jtraj(L5_1, L5_0, 5);

jtrajL6_01 = jtraj(L6_0, L6_1, 5);
jtrajL6_10 = jtraj(L6_1, L6_0, 5);

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

% Animation
for i = 1:size(jtrajL1_01,1)
    % ODD Legs Move Forward
    L1.animate(jtrajL1_01(i,:));
    L3.animate(jtrajL3_01(i,:));
    L5.animate(jtrajL5_01(i,:));
    
    % EVEn Legs Hold Stil
    L2.animate(jtrajL2_01(1,:));
    L4.animate(jtrajL4_01(1,:));
    L6.animate(jtrajL6_01(1,:));
end

for i = 1:size(jtrajL1_10,1)
    % ODD Legs Move Backward
    L1.animate(jtrajL1_10(i,:));
    L3.animate(jtrajL3_10(i,:));
    L5.animate(jtrajL5_10(i,:));

    % EVEN Legs Move Forward
    L2.animate(jtrajL2_01(i,:));
    L4.animate(jtrajL4_01(i,:));
    L6.animate(jtrajL6_01(i,:));
end

for i = 1:size(jtrajL2_01,1)
    % EVEN Legs Move Backward
    L2.animate(jtrajL2_10(i,:));
    L4.animate(jtrajL4_10(i,:));
    L6.animate(jtrajL6_10(i,:));

    % ODD Legs Move Forward
    L1.animate(jtrajL1_01(i,:));
    L3.animate(jtrajL3_01(i,:));
    L5.animate(jtrajL5_01(i,:));
end

for i = 1:size(jtrajL2_01,1)
    % ODD Legs Move Backward
    L1.animate(jtrajL1_10(i,:));
    L3.animate(jtrajL3_10(i,:));
    L5.animate(jtrajL5_10(i,:));
end

