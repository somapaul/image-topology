% even klein grid figures
%%
figure; 
scatter(distA(:,1),distA(:,2),'r*')
hold on;
scatter(distA_naive(:,1),distA_naive(:,2),'b.')
title('distA')


figure; 
scatter(distB(:,1),distB(:,2),'r*')
hold on;
scatter(distB_naive(:,1),distB_naive(:,2),'b.')
title('distB')


diffsA = zeros(sz(2),1);
diffsB = zeros(sz(1),1);
for i = 1:(sz(1)-1)
    diffsB(i) = distB(i+1,2) - distB(i,2);
end
for j = 1:(sz(2)-1)
    diffsA(j) = distA(j+1,2) - distA(j,2);
end


diffsA_naive = zeros(sz(2),1);
diffsB_naive = zeros(sz(1),1);
for i = 1:(sz(1))
    diffsB_naive(i) = distB_naive(i+1,2) - distB_naive(i,2);
end
for j = 1:(sz(2))
    diffsA_naive(j) = distA_naive(j+1,2) - distA_naive(j,2);
end


figure; scatter(distA_naive(1:end-1,1),diffsA_naive,'r*')
hold on; scatter(distA(1:end-1,1),diffsA,'b.')
xlabel('"rotation" parameter \alpha')
ylabel('change in distance between points')
title('Change in Distance Between Points in "Rotation" Direction')
legend({'naive parameter generation method','linear interpolation parameter method, 5 iterations'},'Location','southwest')
figure; scatter(distB_naive(1:end-1,1),diffsB_naive,'r*')
hold on; scatter(distB(1:end-1,1),diffsB,'b.')
xlabel('"linear/quadratic" parameter \phi')
ylabel('change in distance between points')
title('Change in Distance Between Points in "Linear/Quadratic" Direction')
legend({'naive parameter generation method','linear interpolation parameter method, 5 iterations'}, 'Location', 'southwest')