function [coins] =  FAST2(image, seuil, n)
image = rgb2gray(image);
[l,c] = size(image);
% Detection des caracteristique
coins = [];
for i= 4:l-3
    for j = 4:c-3
        i_p = image(i,j);
        
        P = [image(i,j-3), image(i+1,j-3), image(i+2,j-2), image(i+3,j-1), image(i+3,j), image(i+3,j+1), image(i+2,j+2), image(i+1,j+3),image(i,j+3), image(i-1,j+3), image(i-2,j+2), image(i-3,j+1), image(i-3,j),image(i-3,j-1) ,image(i-2,j-2) ,image(i-1,j-3)];
         index_P = [i,j-3; i+1,j-3; i+2,j-2; i+3,j-1; i+3,j; i+3,j+1; i+2,j+2; i+1,j+3; i,j+3; i-1,j+3; i-1,j+3; i-2,j+2; i-3,j+1; i-3,j; i-3,j-1; i-2,j-2; i-1,j-3];
        
        % Seuils de comparaisons
        seuil_haut = i_p + seuil;
        seuil_bas = i_p - seuil;
        
        % Les conditions
        condition_1 = [ P(1)> seuil_haut, P(5)> seuil_haut, P(9)> seuil_haut, P(13) > seuil_haut];
        condition_2 = [ P(1)< seuil_bas, P(5)< seuil_bas, P(9)< seuil_bas, P(13) < seuil_bas];
        
        if (sum(condition_1) == 3) || (sum(condition_2) == 3)
            condition_3 = P > seuil_haut;
            condition_4 = P < seuil_bas;
            
            if sum(sum(condition_3)) >= n || sum(sum(condition_4)) >= n
                    % le point est alors un coin
                %distance = abs(P - P(1));
                %[M, I] = max(distance,[],'all', 'linear');
                %coins = [coins, [index_P(I,2); index_P(I,1)]] ;
                coins = [coins, [j;i]];
            end
                    
        end
    end
end

end