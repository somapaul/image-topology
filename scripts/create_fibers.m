% script to create and save fibers over e1, e2, e3, e4

% import patches data
M9 = csvread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/M_9_patches.csv');
M9_map_P3 = csvread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/M_9_as_3by3.csv');
E = csvread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/DCTBasis.csv');

% output paths for fibers
fiberPath = '/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/fibers/';

% various choices of cut param p which we will use
cutP = [0.001, 0.005, 0.01, 0.025 0.05];

for i=1:4
    e = E(i,:);
    eiPath = strcat('over_e', num2str(i));
    for p=cutP
        fiber = extractFiberSimpleKnn(M9_map_P3, M9, p, e);
        
        filename = strcat('e',num2str(i),'_p',num2str(p),'.csv');
        fullFile = fullfile(fiberPath,eiPath,filename);
        
        csvwrite(fullFile,fiber);
    end
end











