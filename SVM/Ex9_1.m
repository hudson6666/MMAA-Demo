clc, clear
a0 = load('fenlei.txt'); % 例9-1
a = a0'; b0 = a(:, [1:27]); dd0 = a(:, [28:end]); % b0：训练数据 dd0：待分类数据
[b,ps] = mapstd(b0); % 用b0行的平均值和标准差标准化
dd = mapstd('apply', dd0, ps); % 用b0行的平均值和标准差标准化
group = [ones(20,1); 2 * ones(7,1)]; % 已知样本点类别标号
s = svmtrain(b', group);
% sv_index = s.SupportVectorIndices % 支持向量的标号
beta = s.Alpha; % 分类函数的常数项 (omega)
bb = s.Bias; % 分类函数的常数项 (b)
% mean_and_std_trans = s.ScaleData % 看文档
disp('Classification fuction:');
fprintf('y = '); fprintf('%f X + ',beta); fprintf('%f\n',bb); % 分类函数
check = svmclassify(s, b');
err_rate = 1 - sum(group == check) / length(group) % 计算已知样本点的错叛率
solution = svmclassify(s, dd')