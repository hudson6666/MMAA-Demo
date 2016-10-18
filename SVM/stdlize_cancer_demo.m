clc, clear
a = load('cancerdata3.txt');
a(:,1) = [];
[tra,sam,gro] = standardlize(a(1:500,:),a(501:569,2:end));
s = svmtrain(tra, gro, 'Kernel_Function', 'quadratic');
check = svmclassify(s, tra);
err_rate = 1 - sum(gro == check) / length(gro)
solution = svmclassify(s, sam);
solution = solution';
sg = find(solution == 1)
sb = find(solution == 0)