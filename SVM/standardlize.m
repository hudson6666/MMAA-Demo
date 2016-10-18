function [ classifiedStdSet, unclassifiedStdSet, group ] = standardlize( classifiedSet, unclassifiedSet )
%SVM standardlize
%  classifiedSet
%    Column 1: Class, could be valued by 0/1
%    Column 2~end: Value of each index
%    Row: Each row is a piece of data
%  unclassifiedSet
%    Column 1~end: Value of each index
%    Row: Each row is a piece of data
group = classifiedSet(:,1) == 1;


training = classifiedSet(:,[2:end]);
training = training';
[classifiedStdSet,ps] = mapstd(training);
classifiedStdSet = classifiedStdSet';
unclassifiedSet = unclassifiedSet';
unclassifiedStdSet = mapstd('apply', unclassifiedSet, ps);
unclassifiedStdSet = unclassifiedStdSet';

end

