function [match1, match2] = clean(matchpts1, matchpts2)
distance = matchpts1 - matchpts2;
med_x = median(distance(:,1));
med_y = median(distance(:,2));
seuil = 150;
match1 = [];
match2 = [];

    for i = 1:length(matchpts1)
        if abs(distance(i, 1)) >= med_x - seuil && abs(distance(i, 1)) <= med_x + seuil
            match1 = [match1; matchpts1(i,:)];
            match2 = [match2; matchpts2(i,:)];
        end
      
    end
end