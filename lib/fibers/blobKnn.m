% script to find nearest neighbors to blob patch

% blob patch parameters
% mean and stadard deviation in x (horizontal) and y (vertical) direction
% for gaussian distributions evaluated to generate patch



patches = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M9/M9_log_meansub_dNormalize',',');

sdx = 1;
mx = 0;
sdy = 1;
my = 0;

target = blobPatch(sdx,mx,sdy,my,'gauss');
target = reshape(target,1,81);

[Idx,D] = knnsearch(patches,target,'K',100000);

dlmwrite('gaussblob_sd1_m0_IDX.txt',Idx','delimiter',',');
dlmwrite('gaussblob_sd1_m0_dists.txt',D','delimiter',',','precision',10);
% 
target2 = blobPatch(sdx,mx,sdy,my,'cos');
target2 = reshape(target2,1,81);

[Idx2,D2] = knnsearch(patches,target2,'K',100000);

dlmwrite('cosblob_sd1_m0_IDX.txt',Idx2','delimiter',',');
dlmwrite('cosblob_sd1_m0_dists.txt',D2','delimiter',',','precision',10);