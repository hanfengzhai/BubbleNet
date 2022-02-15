for i = 1:3001
    
    velo = max(U(:,i));
    velocity{i} = velo;
    
end

velocity = cell2mat(velocity);

%%
p = p_star;
for i = 1:3001
    
    pres = max(p(:,i));
    pressure{i} = pres;
    
end

pressure = cell2mat(pressure);
%%
for i = 1:127
    
    singvelo = max(U(:,i));
    singvelocity{i} = singvelo;
    
end

singvelocity = cell2mat(singvelocity);

%%
% p = p_star;
for i = 1:127
    
    singpres = max(p(:,i));
    singpressure{i} = singpres;
    
end

singpressure = cell2mat(singpressure);