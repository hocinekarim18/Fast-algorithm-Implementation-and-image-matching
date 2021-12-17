clc;
clear all;
close all;

%% Lecture des images
image1 = imread('M2.jpg');
image2 = imread('M3.jpg');

%% Initialisation des paramètres
seuil1 = 80;
seuil2 = 80;
seuil3 = 80;
seuil4 = 80;

n1 = 6;
n2 = 9;
n3 = 12;
n4 = 15;

%% Calcul de l'algorithmes Fast
coins1 = FAST2(image1, seuil1, n1);
coins2 = FAST2(image1, seuil2, n2);
coins3 = FAST2(image1, seuil3, n3);
coins4 = FAST2(image1, seuil4, n4);

figure;

subplot(2,2,1); imshow(image1); hold on; plot(coins1(1,:), coins1(2,:), 'r+'); hold on; title("N = 6, Seuil = 80");
subplot(2,2,2); imshow(image1); hold on; plot(coins2(1,:), coins2(2,:), 'r+'); hold on; title("N = 9, Seuil = 80");
subplot(2,2,3); imshow(image1); hold on; plot(coins3(1,:), coins3(2,:), 'r+'); hold on; title("N = 12, Seuil = 80");
subplot(2,2,4); imshow(image1); hold on; plot(coins4(1,:), coins4(2,:), 'r+'); hold on; title("N = 15, Seuil = 80");

%% Initialisation des paramètres
seuil1 = 20;
seuil2 = 40;
seuil3 = 60;
seuil4 = 80;

n1 = 12;
n2 = 12;
n3 = 12;
n4 = 12;

%% Calcul de l'algorithmes Fast
coins1 = FAST2(image1, seuil1, n1);
coins2 = FAST2(image1, seuil2, n2);
coins3 = FAST2(image1, seuil3, n3);
coins4 = FAST2(image1, seuil4, n4);

figure;

subplot(2,2,1); imshow(image1); hold on; plot(coins1(1,:), coins1(2,:), 'r+'); hold on; title("N = 12, Seuil = 20");
subplot(2,2,2); imshow(image1); hold on; plot(coins2(1,:), coins2(2,:), 'r+'); hold on; title("N = 12, Seuil = 40");
subplot(2,2,3); imshow(image1); hold on; plot(coins3(1,:), coins3(2,:), 'r+'); hold on; title("N = 12, Seuil = 60");
subplot(2,2,4); imshow(image1); hold on; plot(coins4(1,:), coins4(2,:), 'r+'); hold on; title("N = 12, Seuil = 80");

