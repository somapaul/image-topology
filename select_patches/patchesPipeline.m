% main pipeline for patch sampling
%   start with nothing
%   end up with a random sample of image patches, M
%   save patches sample to ../patches

n = 5000; 
cut = 0.2; 
dim = 81;
imgPath = './van-hateren-images/';

% get high 9 by 9 patches M9
patches = createPatchSample(n, cut, dim, imgPath);

% save to csv
dataPath = './patches/';
%idString = sprintf('n%d_m%d_cut%.02f_k%d_dim%d', n, m, (cut*100), k, dim);
patches_f = fullfile(dataPath,'M9.csv'); 
csvwrite(patches_f, patches);
