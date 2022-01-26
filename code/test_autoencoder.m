% InImagee=[];
% for k=1:45
%      InImage=im2double(imread([num2str(k) '-fussed.bmp']));
%      [mappedX, mapping] = compute_mapping(InImage,'Autoencoder',100);
%      im1=reconstruct_data(mappedX,mapping);
%      InImagee{k}=im1;
% end

d1=load('cd_rca_fussed.mat');
D=d1.cd_rca;
A = zeros(45,4);
[rows columns] = size(A);
secondColumn = imresize((1:rows/5)', [rows, 1], 'nearest');
A(:, 2) = secondColumn;
D1=[D secondColumn];
sec=1:2:45;
[mappedX, mapping] = compute_mapping(D1(sec,:),'Autoencoder',256);
diste=[];
X=mappedX;
for i=1:23
    for j=1:23
        diste(i,j)=1-norm(X(i,:)-X(j,:))/(norm(X(i,:))+norm(X(j,:)));
    end
end
im1=reconstruct_data(D,mapping);
dist1=[];
X=im1;
for i=1:45
    for j=1:45
        dist1(i,j)=1-norm(X(i,:)-X(j,:))/(norm(X(i,:))+norm(X(j,:)));
    end
end

% im=imread('1-fussed.bmp');
% figure;
% imshow(im)
% InImage=rand(1,1000);


