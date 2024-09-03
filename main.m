load 'data1';
test=testData{1}{1};  
test{1}(:,1)=test{1}(:,1)-test{1}(1,1);
test{1}(:,2)=(test{1}(:,2)-min(test{1}(:,2)))/(max(test{1}(:,2))-min(test{1}(:,2)));
test{1}(:,3)=1-(test{1}(:,3)-epslon)/(max(test{1}(:,3))-epslon);
a=test{1};
n=10;
smallestNIdx = l_distance(test,C,w1,w2,w3,w4,n);
index1=smallestNIdx;
model = modelSelect(C(2,index1),b)
priorParameter = prior(C,index1,model,b);
Main_FitDistribution_GUI
c=1:1138;%Ëæ»úÑ¡È¡
smallestNIdx=c(randperm(numel(c),10))
index1=smallestNIdx;
model = modelSelect(C(2,index1),b)
priorParameter = prior(C,index1,model,b);
Main_FitDistribution_GUI
gamfit(data)
 [m,v] = gpstat(0.19843,0.15093,0.13347)
 [output1,testData] = randomTest(testData,epslon);
 predict=cell(1,1);
 for i=1:length(testData)
     for j=1:length(testData{i})
         num=1;
         for k=1:length(testData{i}{j})
             matrix=testData{i}{j}{k};
             if length(matrix(1:end-num,1))>2
                 num=num+1;
             end
             result=y_t_fitting(matrix(1:end-num,1),matrix(1:end-num,3));
             predict{i}{j}{k}(num,1) = inference(result{1},result{end},matrix(1:end-num,:));
         end                                            
     end
 end
 
 VS=(1-Ep)*RUL/ED*c1
 VR+VS-VC
 y2=[];
 
 for N=80:4:100
     for RUL=1:5
        
         for L=6:10
              num=1;
             for N1=0.0:0.1:0.9
                 objectiveValue1 = optimal(N,RUL,N*N1,N*(0.9-N1),L);
                 y2(num,RUL,L,N)=objectiveValue1;
                 num=num+1;
             end
             
         end
         
     end
     
 end
 L=[];
 for i=1:size(line6_allVehicle,2)
     for j=1:size(line6_allVehicle{i},2)
         for k=1:size(line6_allVehicle{i}{j},2)
             L=cat(1,L,size(line6_allVehicle{i}{j}{k},1));
         end
     end
 end
 
 load 'data1';
  for k=1:size(line6_allVehicle{20}{3},2)
             plot(line6_allVehicle{20}{3}{k}(:,1),line6_allVehicle{20}{3}{k}(:,3));
             hold on;
  end