%7*7局部直方图均衡
% [I_stand,map]=imread('elain.bmp');
%  I_stand=ind2gray(I_stand,map);
% %  I_match=imhist(I_stand);
for i=1:4
    if i==4
       [I,map]=imread('local.bmp');
        I1=rgb2gray(I);
    else
        [I,map]=imread(['elain_',num2str(i,'%d'),'.bmp']);
        I1=ind2gray(I,map);
    end

  
figure,
subplot(2,2,1),imhist(I1,256);title(['elain',num2str(i,'%d'),'直方图']);
subplot(2,2,3),imshow(I1);title(['elain',num2str(i,'%d'),'原图']);

%局部匹配
I_out=uint8(zeros(512,512));
for j=1:3:506
    for k=1:3:506
    I_match=imhist(I1(j:j+6,k:k+6));%(7*j-6:7*j,7*k-6:7*k)、(j:j+6,k:k+6)
    I_out(j:j+6,k:k+6)=histeq(I1(j:j+6,k:k+6));
    
    end
end
I_out(512,:)=histeq(I1(512,:));
I_out(:,512)=histeq(I1(:,512));


subplot(2,2,2),imhist(I_out);title(['elain',num2str(i,'%d'),'局部均衡后直方图']);
subplot(2,2,4),imshow(I_out);title(['elain',num2str(i,'%d'),'局部均衡后图片']);

end