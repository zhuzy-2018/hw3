%ֱ��ͼƥ��
name=('woman');
[I_stand,map]=imread([name,'.bmp']);
 I_stand=ind2gray(I_stand,map);
 I_match=imhist(I_stand);
 figure,
 subplot(2,1,1),imhist(I_stand);
 subplot(2,1,2),imshow(I_stand);
for i=1:2
    
[I,map]=imread([name,'_',num2str(i,'%d'),'.bmp']);
I1=ind2gray(I,map);

figure,
subplot(2,2,1),imhist(I1,256);title([name,num2str(i,'%d'),'ֱ��ͼ']);
subplot(2,2,3),imshow(I1);title([name,num2str(i,'%d'),'ԭͼ']);



I_out=histeq(I1,I_match);

subplot(2,2,2),imhist(I_out);title([name,num2str(i,'%d'),'ƥ���ֱ��ͼ']);
subplot(2,2,4),imshow(I_out);title([name,num2str(i,'%d'),'ƥ���ͼƬ']);

saveas(gcf,['task3_',name,num2str(i,'%d'),'.jpg']);
   
end