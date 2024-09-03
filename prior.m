function priorParameter = prior(C,G,model,a) %G表示历史数据集
priorParameter=[];
if model==1
    x=sdpvar(1,2,'full');
    % 约束添加
    C1 = [];
    C1=[C1,x(1)>0];
    C1=[C1,x(2)>0];
    Q1=0;
    for i=1:length(G)
        matrix=C{2,G(i)};
        T=matrix(:,1);
        deltaY=matrix(2:end,3)-matrix(1:end-1,3);
        deltaY(deltaY==0)=0.001;
        x=sdpvar(1,2,'full');
        % 约束添加
        C1 = [];
        C1=[C1,x(1)>0];
        C1=[C1,x(2)>0];
        Q1=0;
        for j=1:length(deltaY)
            Q1=Q1+x(1)*(T(j+1)^a-T(j)^a)*log(x(2))+log(deltaY(j))*(x(1)*(T(j+1)^a-T(j)^a)-1)-x(2)*deltaY(j)-log(gamma(x(1)*(T(j+1)^a-T(j)^a)));
        end
        ops = sdpsettings('verbose',0,'solver','ipopt');
% % 求解
        result  = optimize(C1,-Q1,ops);
        objectiveValue1=value(-Q1);
        x=value(x);
        priorParameter=cat(1,priorParameter,x);
    end
    
end
if model==2
    a=2;
    for i=1:length(G)
        matrix=C{2,G(i)};
        T=matrix(:,1);
        deltaY=matrix(2:end,3)-matrix(1:end-1,3);
        z=sdpvar(1,3,'full');
    % 约束添加
        C2=[];
        C2=[C2,z(1)>0];
        C2=[C2,z(2)>0];
        C2=[C2,z(3)>0];
        Q2=0;
        for j=1:length(deltaY)
            Q2=Q2+(z(1)*(T(j+1)^a-T(j)^a)-1)*log(deltaY(j))+z(2)*log(z(3))+log(gamma(z(1)*(T(j+1)^a-T(j)^a)+z(2)))-log(gamma(z(1)*(T(j+1)^a-T(j)^a)))...
            -log(gamma(z(2)))-(z(1)*(T(j+1)^a-T(j)^a)+z(2))*log(deltaY(j)+z(3));
        end
        ops = sdpsettings('verbose',0,'solver','ipopt');
% % 求解
        result  = optimize(C2,-Q2,ops);
        objectiveValue2=value(-Q2);
        z=value(z);
        priorParameter=cat(1,priorParameter,z);
    end
    
end
priorParameter=priorParameter(~ismember(priorParameter(:,2),[1,1.00000001000000]),:); %删去[1,1]的行
end

