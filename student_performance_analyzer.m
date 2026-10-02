clc;
clear;
close all;

%% STUDENT MARK ANALYZER - FUTURISTIC VERSION

% Subjects
subjects = {'Tamil','English','Mathematics','Physics','Chemistry','Biology/Computer Science'};

% Student name
name = input('Enter student name: ','s');

% Enter marks
marks = zeros(1,6);

for i = 1:6
    marks(i) = input(['Enter marks in ', subjects{i}, ': ']);
end

%% Calculations

total = sum(marks);
average = mean(marks);
highest = max(marks);
lowest = min(marks);

% Grade
if average >= 90
    grade = 'A+';
elseif average >= 80
    grade = 'A';
elseif average >= 70
    grade = 'B';
elseif average >= 60
    grade = 'C';
elseif average >= 50
    grade = 'D';
else
    grade = 'F';
end

% Result
if all(marks >= 40)
    result = 'PASS';
else
    result = 'FAIL';
end

%% Performance Status

if average >= 85
    status = 'Excellent Performance';
elseif average >= 70
    status = 'Good Performance';
elseif average >= 50
    status = 'Average Performance';
else
    status = 'Needs Improvement';
end

%% Recommendation

[~, weakIndex] = min(marks);
weakSubject = subjects{weakIndex};

recommendation = ['Focus more on ', weakSubject];

%% Command Window Output

fprintf('\n====================================\n');
fprintf('       STUDENT PERFORMANCE AI\n');
fprintf('====================================\n');

fprintf('Student       : %s\n',name);
fprintf('Total Marks   : %.0f / 600\n',total);
fprintf('Average       : %.2f%%\n',average);
fprintf('Highest Mark  : %.0f\n',highest);
fprintf('Lowest Mark   : %.0f\n',lowest);
fprintf('Grade         : %s\n',grade);
fprintf('Result        : %s\n',result);
fprintf('Status        : %s\n',status);
fprintf('Recommendation: %s\n',recommendation);

fprintf('====================================\n');

%% FUTURISTIC DASHBOARD

fig = uifigure('Name','Student Performance Analyzer',...
    'Position',[100 100 1000 650]);

% Main title
uilabel(fig,...
    'Text','STUDENT PERFORMANCE ANALYZER',...
    'Position',[280 590 450 35],...
    'FontSize',22,...
    'FontWeight','bold');

uilabel(fig,...
    'Text',['Student: ',name],...
    'Position',[30 555 400 25],...
    'FontSize',16,...
    'FontWeight','bold');

%% Information cards

uilabel(fig,...
    'Text',sprintf('TOTAL\n%.0f / 600',total),...
    'Position',[40 450 180 80],...
    'HorizontalAlignment','center',...
    'FontSize',18,...
    'FontWeight','bold');

uilabel(fig,...
    'Text',sprintf('AVERAGE\n%.1f %%',average),...
    'Position',[250 450 180 80],...
    'HorizontalAlignment','center',...
    'FontSize',18,...
    'FontWeight','bold');

uilabel(fig,...
    'Text',sprintf('GRADE\n%s',grade),...
    'Position',[460 450 180 80],...
    'HorizontalAlignment','center',...
    'FontSize',18,...
    'FontWeight','bold');

uilabel(fig,...
    'Text',sprintf('RESULT\n%s',result),...
    'Position',[670 450 180 80],...
    'HorizontalAlignment','center',...
    'FontSize',18,...
    'FontWeight','bold');

%% Performance Chart

ax = uiaxes(fig,...
    'Position',[50 100 550 300]);

bar(ax,marks);

ax.XTick = 1:6;
ax.XTickLabel = subjects;
ax.YLim = [0 100];

title(ax,'SUBJECT PERFORMANCE');
ylabel(ax,'MARKS');
grid(ax,'on');

%% Performance Gauge

gauge = uigauge(fig,'semicircular',...
    'Position',[650 170 280 180]);

gauge.Limits = [0 100];
gauge.Value = average;

uilabel(fig,...
    'Text','OVERALL PERFORMANCE',...
    'Position',[700 130 180 25],...
    'HorizontalAlignment','center',...
    'FontWeight','bold');

%% Recommendation

uilabel(fig,...
    'Text',['Recommendation: ',recommendation],...
    'Position',[50 50 850 30],...
    'FontSize',15,...
    'FontWeight','bold');
