clc;
clear all;
close all;

%% Lecture des images
image1 = imread('P1.jpg');
image2 = imread('P2.jpg');

%% Initialisation des paramètres
seuil = 25;
n = 12;

%% Calcul de l'algorithmes Fast
coins1 = FAST2(image1, seuil, n);
coins2 = FAST2(image2, seuil, n);

% Affichage des coins détectés
figure;
subplot(1,2,1); imshow(image1); hold on; plot(coins1(1,:), coins1(2,:), 'r+'); hold on;
subplot(1,2,2); imshow(image2); hold on; plot(coins2(1,:), coins2(2,:), 'r+'); hold on;


%% Features descriptors extraction
image1 = double(rgb2gray(image1));
image2 = double(rgb2gray(image2));
coins1 = coins1';
coins2 = coins2';
[descriptor1, descriptor2] = extract_descriptor(image1, image2, coins1, coins2);

%% Calcul des indices des matchpts et les récupérer
index = pts_matching(descriptor1, descriptor2 );
matchpts1 = coins1(index(:,1),:);
matchpts2 = coins2(index(:,2),:);


%% Nettoyage des matchpoints
%[match1, match2] = clean(matchpts1, matchpts2);

%% Camcil de la matrice homographique
 h = homographie(matchpts1, matchpts2)

 
%% Afficher les matchpts
figure;
subplot(1,2,1); imagesc(image1); hold on; plot(matchpts1(:,1), matchpts1(:,2), 'r+'); hold on;
subplot(1,2,2); imagesc(image2); hold on; plot(matchpts2(:,1), matchpts2(:,2), 'r+'); hold on;











