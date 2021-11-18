clc
fid = fopen('gradovi.txt');
i=0;

tline = fgetl(fid);
while ischar(tline)
    i = i+1;
    C = strsplit(tline, ' ');
    people(i).naziv = C{1};
    tline = fgetl(fid);
end
fclose(fid);

G.V = people;
t = triu(rand(i)>0.96, 1);
G.AdjMatrix =  t + t';
clear people t tline C ans fid i

