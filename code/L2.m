function y = L2( v,v0 )
[n,m]=size(v);
sigma=0.4;
r=0.05;
D=0.02;
y(1,:)=25^2*sigma^2/2*(v0-2*v(1,:)+v(2,:))+25*(r-D)/2*(v(2,:)-v0)-r*v(1,:);
for i=2:n-1
    y(i,:)=(24+i)^2*sigma^2/2*(v(i-1,:)-2*v(i,:)+v(i+1,:))+(24+i)*(r-D)/2*(v(i+1,:)-v(i-1,:))-r*v(i,:);
end
y(n,:)=(24+n)*(r-D)*(v(n,:)-v(n-1,:))-r*v(n,:);
y=max(y,0);
