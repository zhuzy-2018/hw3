%局部直方图增强
[I,map]=imread('lena.bmp');
I1=ind2gray(I,map);
% I1=rgb2gray(I);
[sx,sy]=size(I1);
%figure,
subplot(1,2,1),imshow(I1);title('原图像');
I1=double(I1);
n=7;%局部边长
m=1;%隔m个像素遍历
E=4;%亮度放大倍数,E
k=[0.4,0.02,0.4];%k0,k1,k2
mG=mean(I1(:));
sigmaG=std(I1(:));
temp_I = padarray(I1,[n n],'replicate');
temp_I2=temp_I;
% figure,imshow(temp_I);
for i=(n+1)/2:m:sx+n+(n+1)/2
    for j=(n+1)/2:m:sy+n+(n+1)/2
        s_part=temp_I(i-(n-1)/2:i+(n-1)/2,j-(n-1)/2:j+(n-1)/2);
        mS=mean(s_part(:));
        sigmaS=std(s_part(:));
        
        if (mS<=k(1)*mG) & (sigmaS>=k(2)*sigmaG) & (sigmaS<=k(3)*sigmaG)
%             temp_I(i,j)=temp_I(i,j)+E*(temp_I(i,j)-mS);
            temp_I2(i,j)=E*temp_I(i,j);
        end
    end
end
%%
I2=zeros(sx,sy);
I2(:,:)=temp_I2(n+1:sx+n,n+1:sy+n);
I2=uint8(I2);
I1=uint8(I1);
subplot(1,2,2),imshow(I2);title(['参数：E=',num2str(E),' k0=',num2str(k(1)),' k1=',num2str(k(2)),' k2=',num2str(k(3))]);
sum(sum(double(I2)-double(I1)),2)