x=1:1:7;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
a=[1064,693,2009,1561,12677,2667,6433]; %a数据y值
b=[805,700,1498,1561,11361,2667,2947]; %b数据y值
plot(x,a,'-*b',x,b,'-or'); %线性，颜色，标记
% axis([0,6,0,700])  %确定x轴与y轴框图大小
% set(gca,'XTick',[0:1:6]) %x轴范围1-6，间隔1
% set(gca,'YTick',[0:100:700]) %y轴范围0-700，间隔100
legend('with joint limt','without joint limit');   %右上角标注
xlabel('pos-ori-group','fontsize',20)  %x轴坐标描述
ylabel('iteration','fontsize',20) %y轴坐标描述
set(gca,'fontsize',20);
% x=1:1453;
% plot(x,pos_vector);
% xlabel('iteration')  %x轴坐标描述
% ylabel('position error') %y轴坐标描述
% figure;plot(x,ori_vector);
% xlabel('iteration')  %x轴坐标描述
% ylabel('orientation error') %y轴坐标描述