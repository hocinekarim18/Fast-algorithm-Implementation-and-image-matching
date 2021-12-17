function [H1] = homographie(Pimage1,Pimage2)
% Résoudre un problème de forme A.h = 0

 A = [];
for i = 1:length(Pimage1)
    %% Transformer les coordonnées en coordonées homogène
    Pimage1(i,3) = 1; 
    Pimage2(i,3) = 1;
    
    %% Construire la matrice A
    xi = Pimage1(i,1);
    yi = Pimage1(i,2);
    ui = Pimage2(i,1);
    vi = Pimage2(i,2);
    
    Ai =[ 0  0   0        -Pimage1(i,:)           vi*Pimage1(i,:)  
          Pimage1(i,:)     0  0  0                -ui*Pimage1(i,:) 
        ];
    
%     Ai =[ Pimage1(i,:)     0  0   0       -ui*Pimage1(i,:)  
%           0  0   0     Pimage1(i,:)       -vi*Pimage1(i,:) 
%         ];
    
    A = [A; Ai];
end
%% Calculer la solution du problème AP = 0
[u,s,v] = svd(A);
H1 = v(:,end);
H1 = reshape(H1, [3,3])';

end

