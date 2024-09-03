function [model,objectiveValue1,objectiveValue2,v] = modelSelect(plugin,a) %用最优化的方法计算似然
%plugin=evalin('base', 'plugin');
x=sdpvar(1,2,'full');
z=sdpvar(1,3,'full');
% 约束添加
C1 = [];
C1=[C1,x(1)>0];
C1=[C1,x(2)>0];
C2=[];
C2=[C2,z(1)>0];
C2=[C2,z(2)>0];
C2=[C2,z(3)>0];
Q1=0; %目标函数
Q2=0; 
for i=1:length(plugin)
    deltaT=plugin{i}(2:end,1)-plugin{i}(1:end-1,1);
    T=plugin{i}(:,1);
    deltaY=plugin{i}(2:end,3)-plugin{i}(1:end-1,3);
    deltaY(deltaY==0)=0.001;
    for j=1:length(deltaT)
        Q1=Q1+x(1)*(T(j+1)^a-T(j)^a)*log(x(2))+log(deltaY(j))*(x(1)*(T(j+1)^a-T(j)^a)-1)-x(2)*deltaY(j)-log(gamma(x(1)*(T(j+1)^a-T(j)^a)));
        %Q=Q+gampdf(deltaY(j),x(1)*(T(j+1)^x(3)-T(j)^x(3)),x(2));
        Q2=Q2+(z(1)*(T(j+1)^a-T(j)^a)-1)*log(deltaY(j))+z(2)*log(z(3))+log(gamma(z(1)*(T(j+1)^a-T(j)^a)+z(2)))-log(gamma(z(1)*(T(j+1)^a-T(j)^a)))...
            -log(gamma(z(2)))-(z(1)*(T(j+1)^a-T(j)^a)+z(2))*log(deltaY(j)+z(3));
        
    end
end
% 参数设置
%ops = sdpsettings('verbose',0);
ops = sdpsettings('verbose',0,'solver','ipopt');
% % 求解
result  = optimize(C1,-Q1,ops);
objectiveValue1=value(Q1);
x=value(x);
result  = optimize(C2,-Q2,ops);
objectiveValue2=value(Q2);
z=value(z);
v=2*(objectiveValue1-objectiveValue2);
if 2*(objectiveValue1-objectiveValue2)>chi2inv(0.95,1)
    model=2;
else
    model=1;
end
end
