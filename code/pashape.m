function v3=pashape(v1,v2,t)
for i=1:50
v3(:,i)=[v1(:,t);v2(:,t,i)];
end