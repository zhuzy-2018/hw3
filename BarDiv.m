%Ö±·½Í¼·Ö¸î
[I1,map]=imread('woman.bmp');
% [I1,map]=imread('elain.bmp');
 I1=ind2gray(I1,map);
 I_match=imhist(I1);
 [T,EM] = otsuthresh(I_match);
 I1 = imbinarize(I1,T);
 figure,imshow(I1);title(['woman ','EM=',num2str(EM,'%d')]);