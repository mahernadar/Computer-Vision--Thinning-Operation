%% Dimitri Leca & Maher nadar   Computer Vision Lab 5: Thinning

%% 1) Zhang and Suen algorithm 
img = imread('leaf2.png');

% We initialize the values:

IT = img;
C = 0;

algo_finished = false;

sizex = size(IT,1);
sizey = size(IT,2);

tic                %calculating time for the loop

while 1==1
    
    % We search M ( first sub iteration)
    M = zeros(sizex, sizey);
    
    for i = 2:sizex-1
        for j = 2:sizey-1
            M(i,j) = checkFirstSubiteration(IT, i, j);
        end
    end
    C = sum(sum(M));
  
    
    IT = IT - M;
    
    if C == 0
        break
    
    else % second sub iteration
        
            % We search M ( first iteration)
            M = zeros(sizex, sizey);
    
            for i = 2:sizex-1
                for j = 2:sizey-1
                    M(i,j) = checkSecondSubiteration(IT, i, j);
                end
            end 
             C = sum(sum(M));
                
            IT = IT - M;
    

            if C == 0
                break
            end
    end
   
    end

      toc      
 
 FINAL_ZaS = and(imcomplement(IT),img);
 
%% 2)   bwmorph Matlab function results comparision:

BW = bwmorph(img,'skel',Inf);
FINAL_bw = and(imcomplement(BW),img);
figure

subplot (2,2,1)
imshow(IT)
title('Skeleton Zhang and Suen')

subplot (2,2,2)
imshow(FINAL_ZaS)
title('skeleton + Original')

subplot (2,2,3)
imshow(BW)
title('Skeleton Zhang and Suen (bmorph MatLAB built-in function)')

subplot (2,2,4)
imshow(FINAL_bw)
title('skeleton + Original (bmorph MatLAB built-in function)')

% calculating time for Leaf, deer and Flying eagle using bwmorph


img1 = imread('deer.png');
img2 = imread('flying-eagle.png');


tic
BW= bwmorph(img,'thin',inf);
toc

tic
BW1= bwmorph(img1,'thin',inf);
toc

tic
BW2= bwmorph(img2,'thin',inf);
toc