function y = L( v )
[n,m]=size(v);
sigma=0.4;
r=0.05;
D=0.02;
y(1,:)=r*(v(2,:)-v(1,:))-(r-D)*v(1,:);
for i=2:n-1
    y(i,:)=i^2*sigma^2/2*(v(i-1,:)-2*v(i,:)+v(i+1,:))+i*(r-D)/2*(v(i+1,:)-v(i-1,:))-r*v(i,:);
end
y(n,:)=n*(r-D)*(v(n,:)-v(n-1,:))-r*v(n,:);

