% sublevel set persistence 
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/fibers')
cd /mnt/home/somapaul/cmse/van_hateren_study/software/3TDATools
init;

ii = 24;
jj = 16;
type = 'log_prior';

fib = loadFiber(ii,jj,type);

pts = fib.fine_images;

[IDX, D] = knnsearch(pts,pts,'K',15);

dens =  D(:,15);

dens = datasample(dens,1000,1);

numpts = size(dens,1);

S = [];

for i=1:numpts
    S = [S; [i-1 , i-1, dens(i)]];
end

for i=1:numpts
    for j=(i+1):numpts
        pi = pts(i,:);
        pj = pts(j,:);
        val = max([dens(i), dens(j), sqrt(sum((pi-pj).^2))]);
        S = [S;[i-1, j-1, val]];
    end
end

[I , J] = rca1mfscm(S,max(dens));

fname = strcat('slsp_',num2str(ii),'_',num2str(jj),'_',datestr(now,'mmddTHHMMSS'));

path = fullfile('/mnt/home/somapaul/cmse/van_hateren_study/software/slsp',fname);

dlmwrite(path,J);
