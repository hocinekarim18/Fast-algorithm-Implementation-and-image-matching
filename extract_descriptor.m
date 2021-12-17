function [descriptor1, descriptor2] = extract_descriptor(image1, image2, corner1, corner2)
    descriptor1 = [];
    descriptor2 = [];
    [l1, c1] = size(image1);
    [l2, c2] = size(image2);
    siz = 5;
    shape = siz*2 + 1;
    for i =  1 : length(corner1)
        if  (corner1(i,2)-siz >= 1) &&  (corner1(i,2)+siz <= l1) && (corner1(i,1)-siz >= 1) &&  (corner1(i,1)+siz <= c1)
            bloc1 = image1( corner1(i,2)-siz :corner1(i,2)+siz, corner1(i,1)-siz: corner1(i,1)+siz);
            bloc1 = reshape(bloc1, [shape*shape, 1]);
            descriptor1 = [descriptor1, bloc1];
        end
    end
        
    for j =  1 : length(corner2)
        if  (corner2(j,2)-siz >= 1) &&  (corner2(j,2)+siz <= l2) && (corner2(j,1)-siz >= 1) &&  (corner2(j,1)+siz <= c2)
            bloc2 = image2( corner2(j,2)-siz :corner2(j,2)+siz, corner2(j,1)-siz: corner2(j,1)+siz);
            bloc2 = reshape(bloc2, [shape*shape, 1]);
            descriptor2 = [descriptor2, bloc2];
        end 
    end
    
  
end