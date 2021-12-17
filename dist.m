function [d] = dist(pt1, pt2)
%d= sqrt((pt1(1,1) - pt2(1, 1))^2 + (pt1(1,2) - pt2(1, 2))^2)
d= sqrt((pt1 - pt2)^2)

end