
data = gaussbloblmdpatches;
ii = 10
jj = 10
%for j=1:5
figure, 
idx = 1;
for i=1:ii
    patch = data(i,:);
    patch = (patch + 1) * (4/5);
    subplot(ii,jj,idx);
    imshow(reshape(patch,9,9));
    idx = idx + 1;

end
% 
% data = patches;
% 
% IDX = [1,25;13,1]
% for i=1:2
%     patch = data{IDX(i,:)};
%     patch = (patch + 1) * (4/5);
%     subplot(1,2,i);
%     imshow(reshape(patch,3,3));
% end
