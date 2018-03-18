function Peano3D(level, init, axes, orientation, Position)
% Generate a space filling curve (Peano curve) for a sequence 1..n
% level: the level of Peano3D
% init: the initual index of the sequence
% axes: gives the order of changes for axes, 1.x, 2.y, 3.z .e.g(1 3 2)
% orientation: the orientation (+1, -1) for the 3 axes as same order of axes.
% e.g (1,1,1)
% Position: the inititual position of initiutal point (x, y, x)
% Two global variables Position3D and Occupation3D will be set up after you
% run this program. 
% Position3D is a N X 3 matrix gives all coordinates of each sequence
% elements.
% Occupation3D is a M X M X M matrix gives if the position in the 3D Cube
% has been occupied by a sequence element.   This is not useful for normal
% custom. You can simply ignore it.
%
% Example: 
 global Position3D;
 Position3D = zeros(1000000, 3);
 level =2;
 init = 1;
 axes = [1 3 2];
 orientation = [1 1 1];
 Position = [3 3 3];
 Peano3D(level, init, axes, orientation, Position);
 vol=2^level^3
 plot3(Position3D(1:vol, 1), Position3D(1:vol,2), Position3D(1:vol ,3),'LineWidth',6);
%%
% This software is developed by Zhihua Zhang (Zhang.zhihua@gmail.com).
% All rights reserved, and covered by BSD License. Please cite the
% following paper and/or website if you publish any work used this program. 
% Paper:  To be updated 
% website: http://zhihuazhang.com
% http://www.mathworks.com/matlabcentral/fileexchange/28529
    global Position3D;
    global Occupation3D;
    unit = 2^(level-1);      
    vol = (2^(level-1)) ^ 3; % the volume of next level
    if level == 1,
	Position3D(init + 0, :) = Position;
    Occupation3D(Position(1), Position(2), Position(3)) = init;
    
    
	Position(axes(1)) = Position(axes(1)) + orientation(1);
	Position3D(init + 1, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 1;

	Position(axes(2)) = Position(axes(2)) + orientation(2);
	Position3D(init + 2, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 2;
    
	Position(axes(1)) = Position(axes(1)) - orientation(1);
	Position3D(init + 3, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 3;

	Position(axes(3)) = Position(axes(3)) + orientation(3);
	Position3D(init + 4, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 4;
    
	Position(axes(1)) = Position(axes(1)) + orientation(1);
	Position3D(init + 5, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 5;
    
	Position(axes(2)) = Position(axes(2)) - orientation(2);
	Position3D(init + 6, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 6;
    
	Position(axes(1)) = Position(axes(1)) - orientation(1);
	Position3D(init + 7, :) = Position;
    Occupation3D(Position(1), Position(2),Position(3)) = init + 7;
    
	return;
    end
    %A  1
    newaxes = axes(3:-1:1); neworient = orientation(3:-1:1);
    Peano3D(level -1, init, newaxes, neworient, Position);
    
    %B  2
    Position(axes(1)) = Position(axes(1)) + orientation(1) * unit;
    newaxes=[axes(3) axes(1:2)]; 
    neworient=[orientation(3) orientation(1:2)];     
    Peano3D(level -1, init + 1 * vol, newaxes, neworient, Position);
    % 3
    Position(axes(2)) = Position(axes(2)) + orientation(2) * unit;
    Peano3D(level -1, init + 2 * vol, newaxes, neworient, Position);

    %C 4    
    Position(axes(1)) = Position(axes(1)) - orientation(1) ;
    Position(axes(2)) = Position(axes(2)) + orientation(2) * (unit - 1);
    newaxes = axes; 
    neworient = [-1 * orientation(1:2), orientation(3)];
    Peano3D(level -1, init + 3 * vol, newaxes, neworient, Position);
    % 5
    Position(axes(3)) = Position(axes(3)) + orientation(3) * unit;
    Peano3D(level -1, init + 4 * vol, newaxes, neworient, Position);

    %D 6
    newaxes=[axes(3) axes(1:2)];
    neworient = [(-1 * orientation(3)) orientation(1) (-1 * orientation(2))];
    Position(axes(1)) = Position(axes(1)) + orientation(1);
    Position(axes(3)) = Position(axes(3)) + orientation(3) * (unit - 1);
    Peano3D(level -1, init + 5 * vol, newaxes, neworient, Position);
    %  7
    Position(axes(2)) = Position(axes(2)) - orientation(2) * unit;
    Peano3D(level -1, init + 6 * vol, newaxes, neworient, Position);

    %E 8
    newaxes=axes(3:-1:1);
    neworient=orientation(3:-1:1);
    neworient([1 3]) = -1 * neworient([1 3]);
    Position(axes(2)) = Position(axes(2)) - orientation(2) * (unit-1);
    Position(axes(1)) = Position(axes(1)) - orientation(1);
    Peano3D(level -1, init + 7 * vol, newaxes, neworient, Position);
 
return;
end