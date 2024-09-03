function L1 = likelihood1(x,plugin)
L1=0;
a=1;
for i=1:length(plugin)
    %deltaT=plugin{i}(2:end,1)-plugin{i}(1:end-1,1);
    T=plugin{i}(:,1);
    deltaY=plugin{i}(2:end,3)-plugin{i}(1:end-1,3);
    deltaY(deltaY==0)=0.001;
    for j=1:length(deltaY)
        L1=L1+x(1)*(T(j+1)^a-T(j)^a)*log(x(2))+(x(1)*(T(j+1)^a-T(j)^a)-1)*log(deltaY(j))-x(2)*deltaY(j)-log(gamma(x(1)*(T(j+1)^a-T(j)^a)));
        %L1=L1*gampdf(deltaY(j),x(1)*(T(j+1)-T(j)),x(2));
    end
    

end
% pdf=@(x,u,v,w)(v.^(u.*(x(:,3).^w-x(:,2).^w)).*x(:,1).^(u.*(x(:,3).^w-x(:,2).^w)-1).*exp(-v.*x(:,1))./gamma(v.^(u.*(x(:,3).^w-x(:,2).^w))));
% [phat,pci] = mle(x,'pdf',@(x,a,b)gampdf(x,a,b))
end

