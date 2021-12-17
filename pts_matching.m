function [index] = pts_matching(descriptor1, descriptor2 )

% initialisation
index = [];

[l1, c1] = size(descriptor1);
[l2, c2] = size(descriptor2);
dist1 = [];
dist2 = [];

for i = 1:c1
    for j = 1: c2
        dis = sum(abs(descriptor1(:, i) - descriptor2(:, j) ));
        dist1 = [dist1 ; dis];
    end
    [Min,j0] = min(dist1);
    dist1 = [];
    
    for k = 1 : c1
        dis = sum(abs(descriptor1(:, k) - descriptor2(:, j0) ));
        dist2 = [dist2 ; dis]; 
    end
    [Min,i0] = min(dist2);
    dist2 = [];
    if i0 == i
        index = [index; i0, j0];
    end
           
end