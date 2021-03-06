family_values = countcats(categorical(family));
family_keys = unique(family);

[~, sorting_indices] = sort(family_values, 'descend');
family_values = family_values(sorting_indices);
family_keys = family_keys(sorting_indices);

family_categories = reordercats(categorical(family_keys), family_keys);

%%
bar(family_categories, family_values);

n_xticks = 5;
ax = gca();
ax.FontSize = 8;
ax.YAxis.MinorTickValues = 0:500:3500;
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
set(ax, 'FontSize', 6);

text(0.4, 3650, 'Quantity of data', 'FontSize', 6);

fig = gcf();
set(fig, 'Position', [1 1 265 150]);

scale = 0.05;
pos = get(gca, 'Position');
pos(2) = pos(2)+scale*pos(4);
pos(4) = (1-scale)*pos(4);
set(gca, 'Position', pos)

addpath(genpath('~/export_fig'));
export_fig -transparent -m8 histogram_instruments.png 

%%


%%
x_offset = 1/15; 
x_ticks = [20, 50, 100, 200, 500, 1000, 2000, 5000];

mfamily_values = countcats(categorical(modeFamily));
mfamily_keys = unique(modeFamily);
n_modefamilies = length(mfamily_keys);

[x, sorting_indices] = sort(mfamily_values, 'descend');


n_families = 50;
mfamily_ys = 1:n_families;
sorting_indices = sorting_indices(mfamily_ys);

mfamily_values = mfamily_values(sorting_indices);
mfamily_keys = mfamily_keys(sorting_indices);

family_categories = reordercats(categorical(mfamily_keys), mfamily_keys);
fig = barh(mfamily_ys, log10(x_offset) + log10(mfamily_values));

ax = gca();
xticks(log10(x_ticks) + log10(x_offset));
xticklabels(x_ticks);
xtickangle(45);
xlim([0, log10(x_offset)+log10(5000)]);
yticks(mfamily_ys);
ylim([0, n_families+2]);
yticklabels(mfamily_keys);

xt = get(gca, 'YTick');
set(gca, 'FontSize', 12)

%xlabel('Quantity of data');
ax.Box = 'off';
set(gca(), 'YDir', 'reverse');

fig = gcf();
fig.Position = [1 1 450 900];

drawnow();

export_fig  -transparent histogram_modes.png 
