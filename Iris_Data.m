%%


% 
% *IRISH_Flower Data* 


% Importing file from my Computer

close all;
clear;
clc;
T1 = readtable("C:\Users\salma\OneDrive\Desktop\Matlab_Project\Iris_Data.csv");


% Write the imported file in Matlab in .CSV file

writetable(T1,'Iris_Data.csv');

%  Cleaning the data

class(T1.(1));
class(T1.(2));
class(T1.(3)); 
class(T1.(4));
class(T1.(5));

T2 = readtable("Iris_Data.csv","Format","%f%f%f%f%s");

T2.Properties.VariableNames = {'Sepal_Length','Sepal_width','Petal_Length','Petal_width','Class'};

T2(strcmp(T2.Class,'NA'),:) =[];

B = T2.Class;
y = strings(size(B));
[y{:}] = B{:};
 
T2.Class = y;

% Saving the corrected file in .CSV file

writetable(T2,'Iris_Data.csv')

% Extracting Species into parts from the data

setosa = T2(T2.Class == "Iris-setosa",:);
versicolor = T2(T2.Class =="Iris-versicolor",:);
virginica = T2(T2.Class =="Iris-virginica",:);


%Data analysis only top 10 species from each class(3 * 10 = 30 Species)

Iris_setosa = setosa(1:10,:);
Iris_versicolor = versicolor(1:10,:);
Iris_virginica = virginica(1:10,:);


Iris_setosa.Class = ones(10,1);
Iris_versicolor.Class = ones(10,1)*2;
Iris_virginica.Class = ones(10,1)*3;

%Finding MAX,MIN,MEAN,VAR of Attributes for each 3 Species.

fprintf('\nClass - Iris-Setosa')

fprintf('\n            Sepal Dim           Petal Dim')
fprintf('\n          Length  Width(Cms)   Length  Width(Cms)')
fprintf('\nMax      :  %.2f   %.2f         %.2f    %.2f',max(Iris_setosa.(1)),max(Iris_setosa.(2)),max(Iris_setosa.(3)),max(Iris_setosa.(4)))
fprintf('\nMin      :  %.2f   %.2f         %.2f    %.2f',min(Iris_setosa.(1)),min(Iris_setosa.(2)),min(Iris_setosa.(3)),min(Iris_setosa.(4)))
fprintf('\nMean     :  %.2f   %.2f         %.2f    %.2f',mean(Iris_setosa.(1)),mean(Iris_setosa.(2)),mean(Iris_setosa.(3)),mean(Iris_setosa.(4)))
fprintf('\nVariance :  %.2f   %.2f         %.2f    %.2f',var(Iris_setosa.(1)),var(Iris_setosa.(2)),var(Iris_setosa.(3)),var(Iris_setosa.(4)))


fprintf('\n------------------------------------------------------')

fprintf('\nClass - Iris-Versicolor')

fprintf('\n            Sepal Dim            Petal Dim')
fprintf('\n          Length  Width(Cms)   Length  Width(Cms)')
fprintf('\nMax      :  %.2f   %.2f         %.2f    %.2f',max(Iris_versicolor.(1)),max(Iris_versicolor.(2)),max(Iris_versicolor.(3)),max(Iris_versicolor.(4)))
fprintf('\nMin      :  %.2f   %.2f         %.2f    %.2f',min(Iris_versicolor.(1)),min(Iris_versicolor.(2)),min(Iris_versicolor.(3)),min(Iris_versicolor.(4)))
fprintf('\nMean     :  %.2f   %.2f         %.2f    %.2f',mean(Iris_versicolor.(1)),mean(Iris_versicolor.(2)),mean(Iris_versicolor.(3)),mean(Iris_versicolor.(4)))
fprintf('\nVariance :  %.2f   %.2f         %.2f    %.2f',var(Iris_versicolor.(1)),var(Iris_versicolor.(2)),var(Iris_versicolor.(3)),var(Iris_versicolor.(4)))


fprintf('\n------------------------------------------------------')

fprintf('\nClass - Iris-Virginica')

fprintf('\n            Sepal Dim            Petal Dim')
fprintf('\n          Length  Width(Cms)   Length  Width(Cms)')
fprintf('\nMax      :  %.2f   %.2f         %.2f    %.2f',max(Iris_virginica.(1)),max(Iris_virginica.(2)),max(Iris_virginica.(3)),max(Iris_virginica.(4)))
fprintf('\nMin      :  %.2f   %.2f         %.2f    %.2f',min(Iris_virginica.(1)),min(Iris_virginica.(2)),min(Iris_virginica.(3)),min(Iris_virginica.(4)))
fprintf('\nMean     :  %.2f   %.2f         %.2f    %.2f',mean(Iris_virginica.(1)),mean(Iris_virginica.(2)),mean(Iris_virginica.(3)),mean(Iris_virginica.(4)))
fprintf('\nVariance :  %.2f   %.2f         %.2f    %.2f\n',var(Iris_virginica.(1)),var(Iris_virginica.(2)),var(Iris_virginica.(3)),var(Iris_virginica.(4)))

%Plotting classes vs Sepal length,Sepal Width,Petal Length,Petal Width for
%each Species

figure('Name','Classes vs Species Attributes','NumberTitle','off');

subplot(2,2,1);
plot(Iris_setosa.Class,Iris_setosa.(1),'LineStyle','none','Marker','*');
hold on
plot(Iris_versicolor.Class,Iris_versicolor.(1),'LineStyle','none','Marker','*');
hold on
plot(Iris_virginica.Class,Iris_virginica.(1),'LineStyle','none','Marker','*');
xlim([0,4]);
hold off
title("The length of Sepal of 3 Classes");
xlabel("Classes--->");
ylabel("Sepal Length(Cms)--->");

subplot(2,2,2);
plot(Iris_setosa.Class,Iris_setosa.(2),'LineStyle','none','Marker','*');
hold on
plot(Iris_versicolor.Class,Iris_versicolor.(2),'LineStyle','none','Marker','*');
hold on
plot(Iris_virginica.Class,Iris_virginica.(2),'LineStyle','none','Marker','*');
xlim([0,4]);
hold off
title("The Width of Sepal of 3 Classes");
xlabel("Classes--->");
ylabel("Sepal Width(Cms)--->");


subplot(2,2,3);
plot(Iris_setosa.Class,Iris_setosa.(3),'LineStyle','none','Marker','*');
hold on
plot(Iris_versicolor.Class,Iris_versicolor.(3),'LineStyle','none','Marker','*');
hold on
plot(Iris_virginica.Class,Iris_virginica.(3),'LineStyle','none','Marker','*');
xlim([0,4]);
ylim([0,7]);
hold off
title("The Length of Petal of 3 Classes");
xlabel("Classes--->");
ylabel("Petal Length(Cms)--->");


subplot(2,2,4);
plot(Iris_setosa.Class,Iris_setosa.(4),'LineStyle','none','Marker','*');
hold on
plot(Iris_versicolor.Class,Iris_versicolor.(4),'LineStyle','none','Marker','*');
hold on
plot(Iris_virginica.Class,Iris_virginica.(4),'LineStyle','none','Marker','*');
xlim([0,4]);
ylim([0,3]);
hold off
title("The Width of Petal of 3 Classes");
xlabel("Classes--->");
ylabel("Petal Width(Cms)--->");

grid off;

%Extracting data from the table for Correlation Coefficient

corr_Setosa= [Iris_setosa.(1),Iris_setosa.(2),Iris_setosa.(3),Iris_setosa.(4)];
corr_versicolor= [Iris_versicolor.(1),Iris_versicolor.(2),Iris_versicolor.(3),Iris_versicolor.(4)];
corr_virginica = [Iris_virginica.(1),Iris_virginica.(2),Iris_virginica.(3),Iris_virginica.(4)];


%Displaying  Correlation Matrix for Each classes i.e Species

corr = [corr_Setosa,corr_versicolor,corr_virginica];
Cm = corrcoef(corr);

[rows, cols] = size(corrcoef(corr));

   
fprintf('\n\n\n')

fprintf(' <strong>Correlation Matrix of Iris-Setosa vs Iris-Versicolor vs Iris-Virginica </strong>')
fprintf('\n\n                          Iris-Setosa                            Iris-Versicolor                        Iris-Virginica')
fprintf('\n               Sepal    Septal     Petal     Petal     Sepal     Sepal     Petal     Petal     Sepal     Sepal    Petal      Petal ')
fprintf('\n              length    width     length     width    length     width     length    width     length    width    length     width  \n')
for i = 1 : rows
    if i == 1
       fprintf('Sepal len ')
    end
       if i == 2
       fprintf('Sepal wid ')
       end
       if i == 3
       fprintf('petal len ')
       end
       if i == 4
       fprintf('petal wid ')
      
       end
       if i == 5
       fprintf('Sepal len ')
       end
       if i == 6
       fprintf('Sepal wid ')
       end
       if i == 7
       fprintf('petal len ')
       end
       if i == 8
       fprintf('Petal wid ')
       end
       if i == 9
       fprintf('Sepal len ')
       end
       if i == 10
       fprintf('Sepal wid ')
       end
       if i == 11
       fprintf('petal len ')
       end
       if i == 12
       fprintf('Petal wid ')
       end

    for j=1:cols
        fprintf('%10.3f',Cm(i,j))
    end
    fprintf('\n')
end

% Graphing Frequency for all 3 classes Attributes

figure('Name','Iris-Setosa (Sepal and Petal(cms)) Frequency','NumberTitle','off');
subplot(2,2,1);
histogram(Iris_setosa.(1),7);
ylim([0,4]);
title("Sepal Length(Iris-Setosa)");
xlabel("Iris-Setosa Sepal Length(cms)");
ylabel("Frequency");

subplot(2,2,2);
histogram(Iris_setosa.(2),7);
ylim([0,4]);
title(" Sepal Width(Iris-Setosa)");
xlabel("Iris-Setosa Sepal Width(cms)");
ylabel("Frequency");

subplot(2,2,3);
histogram(Iris_setosa.(3),7);
ylim([0,6]);
title(" Petal Length(Iris-Setosa)");
xlabel("Iris-Setosa Petal Length(cms)");
ylabel("Frequency");

subplot(2,2,4);
histogram(Iris_setosa.(4),7);
title(" Petal Width(Iris-Setosa)");
xlabel("Iris-versicolor Petal Width(cms)");
ylabel("Frequency");
grid off;


figure('Name','Iris-Versicolor (Sepal and Petal(cms)) Frequency','NumberTitle','off');
subplot(2,2,1);
histogram(Iris_versicolor.(1),7);
ylim([0,4]);
title("Sepal Length(Iris-versicolor)");
xlabel("Iris-versicolor Sepal Length(cms)");
ylabel("Frequency");

subplot(2,2,2);
histogram(Iris_versicolor.(2),7);
ylim([0,4]);
title(" Sepal Width(Iris-versicolor)");
xlabel("Iris-versicolor Sepal Width(cms)");
ylabel("Frequency");

subplot(2,2,3);
histogram(Iris_versicolor.(3),7);
ylim([0,5]);
title(" Petal Length(Iris-versicolor)");
xlabel("Iris-versicolor Petal Length(cms)");
ylabel("Frequency");

subplot(2,2,4);
histogram(Iris_versicolor.(4),7);
title(" Petal Width(Iris-versicolor)");
ylim([0,4]);
xlabel("Iris-versicolor Petal Width(cms)");
ylabel("Frequency");
grid off;

figure('Name','Iris-Virginica (Sepal and Petal(cms)) Frequency','NumberTitle','off');
subplot(2,2,1);
histogram(Iris_virginica.(1),7);
ylim([0,3]);
title("Sepal Length(Iris-virginica)");
xlabel("Iris-virginica Sepal Length(cms)");
ylabel("Frequency");

subplot(2,2,2);
histogram(Iris_virginica.(2),7);
ylim([0,4]);
title(" Sepal Width(Iris-virginica)");
xlabel("Iris-virginica Sepal Width(cms)");
ylabel("Frequency");

subplot(2,2,3);
histogram(Iris_virginica.(3),7);
ylim([0,4]);
title(" Petal Length(Iris-virginica)");
xlabel("Iris-virginica Petal Length(cms)");
ylabel("Frequency");

subplot(2,2,4);
histogram(Iris_virginica.(4),7);
ylim([0,5]);
title(" Petal Width(Iris-virginica)");
xlabel("Iris-virginica Petal Width(cms)");
ylabel("Frequency");
grid off;

% OUTPUT