%ֱ��ͼ,����
[I,map]=imread(['elain','.bmp']);
I1=ind2gray(I,map);
figure,subplot(2,1,1),imhist(I1,256);
subplot(2,1,2),imshow(I1);
saveas(gcf,['elain_bar.jpg']);
%%
[I,map]=imread(['woman','.bmp']);
I1=ind2gray(I,map);
figure,subplot(2,1,1),imhist(I1,256);
subplot(2,1,2),imshow(I1);
saveas(gcf,['woman_bar.jpg']);
%%
[I,map]=imread(['citywall','.bmp']);
I1=ind2gray(I,map);
figure,subplot(2,1,1),imhist(I1,256);
subplot(2,1,2),imshow(I1);
saveas(gcf,['citywall_bar.jpg']);
%%
[I,map]=imread(['lena','.bmp']);
I1=ind2gray(I,map);
figure,subplot(2,1,1),imhist(I1,256);
subplot(2,1,2),imshow(I1);
saveas(gcf,['lena_bar.jpg']);
%%
for i=1:2
    
        name=('woman');
[I,map]=imread([name,'_',num2str(i,'%d'),'.bmp']);
I1=ind2gray(I,map);


figure,
subplot(2,2,2),imhist(I1,256);title('����ǰֱ��ͼ');
subplot(2,2,1),imshow(I1);title([name,num2str(i,'%d'),'����ǰ']);

G=histeq(I1,256);
subplot(2,2,4),imhist(G);title('�����ֱ��ͼ');
subplot(2,2,3),imshow(G);title([name,num2str(i,'%d'),'�����']);

saveas(gcf,['task2_',name,num2str(i,'%d'),'.jpg']);
    
end