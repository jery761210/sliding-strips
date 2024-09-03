function L1 = likelihood2(x,plugin)
L1=0;
a=2;
for i=1:length(plugin)
    %deltaT=plugin{i}(2:end,1)-plugin{i}(1:end-1,1);
    T=plugin{i}(:,1);
    deltaY=plugin{i}(2:end,3)-plugin{i}(1:end-1,3);
    deltaY(deltaY==0)=0.001;
    for j=1:length(deltaY)
        L1=L1+(x(1)*(T(j+1)^a-T(j)^a)-1)*log(deltaY(j))+x(2)*log(x(3))+log(gamma(x(1)*(T(j+1)^a-T(j)^a)+x(2)))-log(gamma(x(1)*(T(j+1)^a-T(j)^a)))-log(gamma(x(2)))...
            -(x(1)*(T(j+1)^a-T(j)^a)+x(2))*log(deltaY(j)+x(3));
        %L1=L1+x(1)*(T(j+1)^x(3)-T(j)^x(3))*log(x(2))+(x(1)*(T(j+1)^x(3)-T(j)^x(3))-1)*log(deltaY(j))-x(2)*deltaY(j)-log(gamma(x(1)*(T(j+1)^x(3)-T(j)^x(3))));
    end
    

end

end

