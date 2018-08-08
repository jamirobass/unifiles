function [sq, bp, dl, new_table] = calc_rm()
    table = readtable('/home/nicoluarte/Documents/coaching/data.csv');
    for i = 1:height(table)
        sq(i) = table2array(table(i,2))/(table2array(table(i,3))*3.4+65);
        bp(i) = table2array(table(i,5))/(table2array(table(i,6))*3.4+65);
        dl(i) = table2array(table(i,8))/(table2array(table(i,9))*3.4+65);
    end
    
    sq = sq.*100;
    dl = dl.*100;
    bp = bp.*100;

    new_table =horzcat(table2array(table),sq',bp',dl');

    %create for each couchee

    kohai_1 = new_table(find(new_table(:,1)==1),:);
    kohai_2 = new_table(find(new_table(:,1)==2),:);
    kohai_3 = new_table(find(new_table(:,1)==3),:);
    kohai_4 = new_table(find(new_table(:,1)==4),:);
    kohai_5 = new_table(find(new_table(:,1)==5),:);
    kohai_6 = new_table(find(new_table(:,1)==6),:);
    kohai_7 = new_table(find(new_table(:,1)==7),:);

    figure;
    hold on;
    x = 1:height(table);
    plot(kohai_1(:,2));
    plot(kohai_2(:,2));
    legend('kohai1', 'kohai2')
end
