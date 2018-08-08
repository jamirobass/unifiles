percents = [100, 97.8, 95.5, 93.9, 92.2, 90.7, 89.2, 87.8];
rpe = [10, 9.5, 9, 8.5, 8, 7.5, 7, 6.5];
plot(rpe, percents)
[r, m, b] = regression(rpe, percents);
disp(r)
disp(m)
disp(b)
plotregression(rpe, percents)
