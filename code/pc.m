function y = pc(r,q,s,t,dt,ds,model)
sigma=0.3;
y=(r-q)*s*dt/ds/2+model(t).*s.^2*sigma^2*dt/ds^2/2;
