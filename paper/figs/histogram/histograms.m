family_values = countcats(categorical(family));
family_keys = unique(family);

[~, sorting_indices] = sort(family_values, 'descend');
family_values = family_values(sorting_indices);
family_keys = family_keys(sorting_indices);

family_categories = reordercats(categorical(family_keys), family_keys);
bar(family_categories, family_values);

n_xticks = 5;
ax = gca();
ax.YAxis.MinorTickValues = 0:200:3500;
ax.YAxis.TickValues = 0:1000:3000;

xticks(1:length(family_keys));
xticklabels(family_keys);
xlim([0, length(family_keys)+1]);
ylim([0, 3700]);
ax.Box = 'off';

ax.YGrid = 'on';
ax.MinorGridLineStyle = '--';
ax.GridLineStyle = '-';
xtickangle(45);
set(ax,'yminorgrid', 'on');

text(0.4, 3650, 'Quantity of data');

fig = gcf();
set(fig, 'Position', [1 1 353 369]);
addpath(genpath('~/export_fig'));
export_fig -transparent -m8 histogram_instruments.png 




%%
x_offset = 2; 
x_ticks = [1, 2, 5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000];
%x_tick_labels = 

mfamily_values = countcats(categorical(modeFamily));
mfamily_keys = unique(modeFamily);
n_modefamilies = length(mfamily_keys);

[x, sorting_indices] = sort(mfamily_values, 'descend');

mfamily_ys = [1:10, 51:60, 101:110, (n_modefamilies-9):n_modefamilies];
sorting_indices = sorting_indices(mfamily_ys);

mfamily_values = mfamily_values(sorting_indices);
mfamily_keys = mfamily_keys(sorting_indices);

family_categories = reordercats(categorical(mfamily_keys), mfamily_keys);
y_offset = 2.5;
mfamily_ys = [ ...
    1:10, ...
    (y_offset+10) * 1 + (1:10), ...
    (y_offset+10) * 2 + (1:10), ...
    (y_offset+10) * 3 + (1:10)];
fig = barh(mfamily_ys, log10(2*mfamily_values));

ax = gca();
xticks(log10(x_ticks) + log10(x_offset));
xticklabels(x_ticks);
xtickangle(45);
xlim([0, log10(x_offset)+log10(5000)]);
yticks(mfamily_ys);
yticklabels(mfamily_keys);
ax.Box = 'off';
set(gca(), 'YDir', 'reverse');