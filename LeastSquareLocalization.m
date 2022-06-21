% UWB Anchor-Tag Localization  Using Least-Square Estimation Algorithm
% Author:Hambarci, Goktug
% https://github.com/goktugh
%
%---------------------------------------------------------------------------
%
%
% LSE model is
% Theta = (transpose(H)*H)^-1*transpose(H)*X
%
% H = [ H1,H2,H3,......]         Observation Data
% X = [X1,X2,X3,......]           Model Data
%----------------------------------------------------------------------------
%
%
% Usage=just generate random circle diameter
% pre-define Anchor location can be change A1,A2,A3
% result matrix is res=[X Y r]    X,Y Tag location based on Lse


random = 100 * rand(1, 10);
d1 = random(1) + 10;
d2 = random(2) + 10;
d3 = random(3) + 10;

x1 = 0; % Anchor1 location user define
y1 = 100;

x2 = 100; % Anchor2 location user define
y2 = 100;

x3 = 0; % Anchor3 location user define
y3 = 0;


H = [-2 * x1, -2 * y1, 1; -2 * x2, -2 * y2, 1; -2 * x3, -2 * y3, 1];

X = [(d1)^2 - (x1)^2 - (y1)^2; (d2)^2 - (x2)^2 - (y2)^2; (d3)^2 - (x3)^2 - (y3)^2];

res = ((transpose(H) * H)^-1) * transpose(H) * X;
res(1);
res(2);
res(3);

% ------------------Just Visualize the result-----------------

axis equal
hold on
grid on
xlim([-200, 300])
ylim([-200, 300])
viscircles([x1, y1], d1, 'color', '[0.9290 0.6940 0.1250]'); % Draw Anchor Circle
viscircles([x2, y2], d2, 'color', '[0.4660 0.6740 0.1880]');
viscircles([x3, y3], d3, 'color', 'm');

plot(x1, y1, '.', 'MarkerSize', 20, 'Color', 'r');
plot(x2, y2, '.', 'MarkerSize', 20, 'Color', 'r');
plot(x3, y3, '.', 'MarkerSize', 20, 'Color', 'r');
plot(res(1), res(2), '.', 'MarkerSize', 25, 'Color', 'b'); % Calculated Tag Location

txt = 'TAG';
text(res(1), res(2)+10, txt, 'FontSize', 16)
txt2 = 'A1';
text(x1, y1+10, txt2, 'FontSize', 16)
txt3 = 'A2';
text(x2, y2+10, txt3, 'FontSize', 16)
txt4 = 'A3';
text(x3, y3+10, txt4, 'FontSize', 16)


ax = gca;
ax.FontSize = 15; % Font Size of 15
box on
ax = gca;
ax.LineWidth = 2;
