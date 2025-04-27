function plot_2d(result, title_str)
    plot(result(1, :), result(2, :), DisplayName='Phase portrait'); hold on;
    plot(result(1, 1), result(2, 1), 'r*', DisplayName='Start point');
    legend show;
    grid on;
    xlabel('$x$', Interpreter='latex');
    ylabel('$y$', Interpreter='latex');
    title(title_str);
end