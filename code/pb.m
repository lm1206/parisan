function y = pb(r,s,t,dt,ds,model)
sigma=0.3;
y=-r*dt-model(t).*s.^2*sigma^2*dt/ds^2;