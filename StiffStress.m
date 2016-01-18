clear all
numfiles =15;
myStresses=cell(1,numfiles);
myVonStresses=cell(1,numfiles);
myCycles=cell(1,numfiles);
Mis=zeros(12,15);
Mis1=zeros(12,15);
Ncycle1=zeros(12,15);
Mis=zeros(12,15);
Ncycle=zeros(12,15);
pos_vet=10.32:10.0:120.32;
pos_hor=-28.0:4.0:28.0;
X1=pos_hor'; 
X2=pos_vet';
Str=zeros(12,15);
Str1=zeros(12,15);
u1=zeros(12,15);
v1=zeros(12,15);
w1=zeros(12,15);
Ang=zeros(12,45);
ft=16;
ba=60;
sc=0.5
c=[1 0.5 0]
load 'C:\Users\celestink\Documents\TestingStation\EllptContact2\Allnoinclusions2\Str1noi.txt'
load 'C:\Users\celestink\Documents\TestingStation\EllptContact2\Allnoinclusions2\Misesnoi.txt'
load 'C:\Users\celestink\Documents\TestingStation\EllptContact2\Allnoinclusions2\NCyclesnoi.txt'
for k=1:15
  %  myDispName=sprintf('RailMaxS-%d.txt', k);
  myStressName=sprintf('RailMaxPrinc_%d.txt', k-1);
  myStresses{k}=importdata(myStressName);
  
  myMisesname=sprintf('MiseMax_%d.txt', k-1);
  myCyclesname=sprintf('N_Cycles%d.txt', k-1);
  myMises{k}=importdata(myMisesname);
  myCycles{k}=importdata(myCyclesname);
 % Str(:,k)=myStresses{k};
  L=size(myStresses{k});
 Str(1:L(1),k)=(myStresses{k}(1:L(1)))';
 Mis(1:L(1),k)= (myMises{k}(1:L(1)))';
 Ncycle(1:L(1),k)=(myCycles{k}(1:L(1)))';
 Angs{k}=myStresses{k}(:,2:4);
 Angsd{k}=acosd(Angs{k});
 Ang(1:L(1),((3*k-2):(3*k)))=Angs{k};
 Angd(1:L(1),((3*k-2):(3*k)))=Angsd{k};
 u1(1:L(1),k)=Angs{k}(:,1);
 v1(1:L(1),k)=Angs{k}(:,2);
 w1(1:L(1),k)=Angs{k}(:,3);
figure(k)
axs{k}=axes('Parent',figure(k),'FontSize',ft,'FontName','Times New Roman');
box(axs{k},'on');
hold(axs{k},'on');
%xlim(axes1,[0 X22(end)+10]);
%ylim(axes1,[min(min(Y2)) max(max(Y2))+0.5]);
hold(axs{k},'on');
scatter(X2(1:L(1)),Angs{k}(:,1),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X2(1:L(1)),Angs{k}(:,2),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X2(1:L(1)),Angs{k}(:,3),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Vertical distance from the rail top surface (mm)','FontName','Times New Roman', 'FontSize',ft);
ylabel('Principal direction components','FontName','Times New Roman',  'FontSize',ft);
legend('\it{cos\alpha_1}','\it{cos\beta_1}','\it{cos\gamma_1}')

end
Str1(:,8:15)=Str(:,1:8);
Mis1(:,8:15)=Mis(:,1:8);
Ncycle1(:,8:15)=Ncycle(:,1:8);
u11(:,8:15)=u1(:,1:8);
v11(:,8:15)=v1(:,1:8);
w11(:,8:15)=w1(:,1:8);
 for l=1:7
  Str1(:,l)=Str(:,(15-(l-1)));
  Mis1(:,l)=Mis(:,(15-(l-1)));
  Ncycle1(:,l)=Ncycle(:,(15-(l-1)));
  u11(:,l)=u1(:,(15-(l-1)));
  v11(:,l)=v1(:,(15-(l-1)));
  w11(:,l)=w1(:,(15-(l-1)));
 end
Y1=Str1(:,1:6);
Y2=Str1(:,7:9);
Z=Str1(1:3,:);
Y3=Str1(:,10:15);
V2=Mis1(:,7:9);
W2=Mis1(1:3,:);
figure(16)
axes16=axes('Parent',figure(16),'FontSize',ft,'FontName','Times New Roman');
box(axes16,'on');
hold(axes16,'on');
xlim(axes16,[0 X2(end)+10]);
ylim(axes16,[min(min(Y2)) max(max(Y2))+0.5]);
hold(axes16,'on');
scatter(X2,Y2(:,1),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X2,Y2(:,2),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X2,Y2(:,3),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Vertical distance from the rail top surface (mm)','FontName','Times New Roman', 'FontSize',ft);
ylabel('Maximum principal stress at inclusion  (MPa)','FontName','Times New Roman',  'FontSize',ft);
legend('\itx=-4.0 mm','\itx=0','\itx=4.0 mm') 
% x is the lateral distance from the vertical centerline of the rail cross section
set(legend,...
    'Position',[0.386483427098263 0.00763220135010602 0.214511610308849 0.0809228787088169],...
    'FontSize',18,...
    'FontName','Times New Roman');
figure(17)
axes17=axes('Parent',figure(17),'FontSize',ft,'FontName','Times New Roman');
box(axes17,'on');
hold(axes17,'on');
xlim(axes17,[-X1(end)-10 X1(end)+10]);
ylim(axes17,[0 max(max(Z))+0.5]);
%hold(axes1,'on');
scatter(X1,Z(1,:),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X1,Z(2,:),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X1,Z(3,:),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Lateral position (mm)','FontName','Times New Roman', 'FontSize',ft);
% x is the lateral distance in the rail cross section (left to right)
ylabel('Maximum principal stress at inclusion (MPa)','FontName','Times New Roman',  'FontSize',ft);
legend('\it h=10 mm','\ith=20 mm','\ith=30 mm')
set(legend,...
    'Position',[0.386483427098263 0.00763220135010602 0.214511610308849 0.0809228787088169],...
    'FontSize',18,...
    'FontName','Times New Roman');
figure(18)
axes18=axes('Parent',figure(18),'FontSize',ft,'FontName','Times New Roman');
hold(axes18,'on');
mesh(X1(1:7),X2(1:3),Str1(1:3,1:7)),hold on;
mesh(X1(7:9),X2,Str1(:,7:9)),hold on;
mesh(X1(9:15),X2(1:3),Str1(1:3,9:15)),hold on;
xlabel('X, mm','FontName','Times New Roman','FontSize',ft)
ylabel('Y, mm','FontName','Times New Roman','FontSize',ft)
zlabel('Maximum principal stress at inclusion (MPa)','FontName','Times New Roman',  'FontSize',ft)
Y1=zeros(12,1);

X11=zeros(3,6);
X12=zeros(12,3);
X13=zeros(3,6);
X21=zeros(3,6);
X22=zeros(12,3);
X23=zeros(3,6);
Y1=zeros(3,6);
Y1(:,:)=0;
Y2=zeros(12,3);
Y2(:,:)=0;
Y3=Y1;
X12=zeros(12,3)
for p=1:3
X11(p,:)=(X1(1:6))';
X13(p,:)=(X1(10:15))';
 X22(:,p)=X2;
end
for q=1:6
    X21(:,q)=X2(1:3);
    X23(:,q)=X2(1:3);
end
for q=1:12
    X12(q,:)=(X1(7:9))';
end
figure(19)
axes19=axes('Parent',figure(19),'FontSize',ft,'FontName','Times New Roman');
hold(axes19,'on');
quiver3(Str1(1:3,1:6),u11(1:3,1:6),v11(1:3,1:6),w11(1:3,1:6),sc),hold on;
quiver3(Str1(:,7:9),u11(:,7:9),v11(:,7:9),w11(:,7:9),sc),hold on;
quiver3(Str1(1:3,10:15),u11(1:3,10:15),v11(1:3,10:15),w11(1:3,10:15),sc)
xlabel('X, mm','FontName','Times New Roman','FontSize',ft)
ylabel('Y, mm','FontName','Times New Roman','FontSize',ft)
zlabel('Maximum principal stress at inclusion (MPa)','FontName','Times New Roman',  'FontSize',ft)
figure(20)
axes20=axes('Parent',figure(20),'FontSize',ft,'FontName','Times New Roman');
quiver3(X11,Y1,171.13-X21,u11(1:3,1:6),v11(1:3,1:6),w11(1:3,1:6),sc,'LineWidth',1.5,'color',c),hold on;
quiver3(X12,Y2,171.13-X22,u11(:,7:9),v11(:,7:9),w11(:,7:9),sc,'LineWidth',1.5,'color',c),hold on;
quiver3(X13,Y3,171.13-X23,u11(1:3,10:15),v11(1:3,10:15),w11(1:3,10:15),sc,'LineWidth',1.5,'color',c),hold on;

plot3([-32,32],[-5,-5],[171.13,171.13],'k','LineStyle','--'),hold on;
plot3([-32,32],[5,5],[171.13,171.13],'k','LineStyle','--'),hold on;
plot3([-32,-32],[-5,5],[171.13,171.13],'k','LineStyle','--'),hold on;
plot3([32,32],[-5,5],[171.13,171.13],'k','LineStyle','--'),hold on;

plot3([-32,-10],[-5,-5],[130,130],'k','LineStyle','--'),hold on;
plot3([-32,-10],[5,5],[130,130],'k','LineStyle','--'),hold on;
plot3([10.0,32.0],[-5,-5],[130,130],'k','LineStyle','--'),hold on;
plot3([10.0,32.0],[5,5],[130,130],'k','LineStyle','--'),hold on;

plot3([-32,-32],[-5,5],[130,130],'k','LineStyle','--'),hold on;
plot3([32,32],[-5,5],[130,130],'k','LineStyle','--'),hold on;

plot3([-10,-10],[-5,5],[130,130],'k','LineStyle','--'),hold on;
plot3([10,10],[-5,5],[130,130],'k','LineStyle','--'),hold on;

plot3([-32,-32],[-5,-5],[130,172],'k','LineStyle','--'),hold on;
plot3([32,32],[-5,-5],[130,172],'k','LineStyle','--'),hold on;
plot3([-32,-32],[5,5],[130,172],'k','LineStyle','--'),hold on;
plot3([32,32],[5,5],[130,172],'k','LineStyle','--'),hold on;

plot3([-10,-10],[-5,-5],[45,130],'k','LineStyle','--'),hold on;
plot3([10,10],[-5,-5],[45,130],'k','LineStyle','--'),hold on;
plot3([-10,-10],[5,5],[45,130],'k','LineStyle','--'),hold on;
plot3([10,10],[5,5],[45,130],'k','LineStyle','--'),hold ;

xlabel('Lateral position (mm) ','FontName','Times New Roman','FontSize',ft)
ylabel('Longitudinal, mm','FontName','Times New Roman','FontSize',ft)
zlabel('Vertical position, mm','FontName','Times New Roman',  'FontSize',ft)
save Str1.txt -ascii -double Str1
save Anglesd.txt -ascii -double Angsd
figure(21)
Str1noi(Str1noi==0)=0.001;
StrConc=Str1./Str1noi;
MiseConc=Mis1./Misesnoi
NCyConc=Ncycle1./NCyclesnoi
axes21=axes('Parent',figure(21),'FontSize',ft,'FontName','Times New Roman');
hold(axes21,'on');
mesh(X1(1:7),X2(1:3),StrConc(1:3,1:7)),hold on;
mesh(X1(7:9),X2,StrConc(:,7:9)),hold on;
mesh(X1(9:15),X2(1:3),StrConc(1:3,9:15)),hold on;
xlabel('Lateral position (mm)','FontName','Times New Roman',  'FontSize',ft)
ylabel('Vertical position from the rail base (mm)','FontName','Times New Roman',  'FontSize',ft)
zlabel('Stress concentration factors ','FontName','Times New Roman',  'FontSize',ft)
save StressConcStiff.txt -ascii -double
h=10:10:30
for j=1:3
    figure(21+j)
axis{21+j}=axes('Parent',figure(21+j),'FontSize',ft,'FontName','Times New Roman');
hold(axis{21+j},'on');
box(axis{21+j},'on');
linestyle={'d','o','*'};
linecolor={'k','r','b'};
scatter(X1,u11(j,:),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k'),hold on;
scatter(X1,v11(j,:),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r'),hold on;
scatter(X1,w11(j,:),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b'),hold on;
xlabel('Lateral position (mm)','FontName','Times New Roman',  'FontSize',ft)
ylabel('Principal plane stress directions','FontName','Times New Roman',  'FontSize',ft)
title(['Directions of principal stresses at stiffer inclusion at h=', num2str(h(j)),'mm'],'FontName','Times New Roman',  'FontSize',ft)
legend('\it{cos\alpha_1}','\it{cos\beta_1}','\it{cos\gamma_1}')
end
figure(27)
axes27=axes('Parent',figure(27),'FontSize',ft,'FontName','Times New Roman');
box(axes27,'on');
hold(axes27,'on');
xlim(axes27,[-X1(end)-10 X1(end)+10]);
ylim(axes27,[0 max(max(Z))+0.5]);
%hold(axes1,'on');
scatter(X1,Z(1,:),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X1,Z(2,:),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X1,Z(3,:),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Lateral position (mm)','FontName','Times New Roman', 'FontSize',ft);
% x is the lateral distance in the rail cross section (left to right)
ylabel('Maximum principal stress at inclusion  (MPa)','FontName','Times New Roman',  'FontSize',ft);
legend('\ith=10 mm ','\ith=20 mm','\ith=30 mm')
figure(30)
axes30=axes('Parent',figure(30),'FontSize',ft,'FontName','Times New Roman');
hold(axes30,'on');
box(axes30,'on');
xlim(axes30,[0 X2(end)+10]);
ylim(axes30,[min(min(V2)) max(max(V2))+0.5]);
scatter(X2,V2(:,1),ba,'d','filled','MarkerEdgeColor','k','MarkerFaceColor','k');hold on
scatter(X2,V2(:,2),ba,'o','filled','MarkerEdgeColor','r','MarkerFaceColor','r');hold on
scatter(X2,V2(:,3),ba,'*','filled','MarkerEdgeColor','b','MarkerFaceColor','b');hold on
xlabel('Vertical position from the rail top surface','FontName','Times New Roman', 'FontSize',ft);
ylabel('Maximum von Mises at inclusion (MPa)','FontName','Times New Roman',  'FontSize',ft);
title('Rail maximum von Mises around stiffer inclusion','FontName','Times New Roman',  'FontSize',ft);
legend('\itx=-4.0 mm','\itx=0','\itx=4.0 mm') 

figure(31)
axes31=axes('Parent',figure(31),'FontSize',ft,'FontName','Times New Roman');
box(axes31,'on');
hold(axes31,'on');
xlim(axes31,[-X1(end)-10 X1(end)+10]);
ylim(axes31,[0 max(max(W2))+10]);
%hold(axes1,'on');
scatter(X1,W2(1,:),ba,'d','MarkerEdgeColor','k');hold on
scatter(X1,W2(2,:),ba,'o','MarkerEdgeColor','r');hold on
scatter(X1,W2(3,:),ba,'*','MarkerEdgeColor','b');hold on
xlabel('Lateral position (mm) ','FontName','Times New Roman', 'FontSize',ft);
% x is the lateral distance in the rail cross section (left to right)
ylabel('Maximum von Mises at inclusion (MPa)','FontName','Times New Roman',  'FontSize',ft);
%title('Rail maximum von Mises around stiffer inclusion','FontName','Times New Roman',  'FontSize',ft);
legend('\ith=10 mm ','\ith=20 mm ','\ith=30 mm ')

save StressConcStiff.txt -ascii -double StrConc
save CyclesConcStiff.txt -ascii -double NCyConc
save MisesConcStiff.txt -ascii -double MiseConc