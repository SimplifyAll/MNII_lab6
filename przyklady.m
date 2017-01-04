y1_0 = 1;
y2_0 = 1;
a = 0;
b = 10;
n = 20;
f1 = @(x,y1,y2) 1/y2;
f2 = @(x,y1,y2) -1/y1;

eqSet_runkut( f1, f2, y1_0, y2_0, a, b, n )