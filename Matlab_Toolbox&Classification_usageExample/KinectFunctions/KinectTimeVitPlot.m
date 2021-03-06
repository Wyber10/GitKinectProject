function [] = KinectTimeVitPlot(t,dx,dy,dz,nbPoints,legende)
    % Plot the position speed in time with legend

    figure;
    
    subplot(3,1,1);
    hold all;
    for i=1:nbPoints
        plot(t(1:length(dx(:,i))-4),dx((1:length(dx(:,i))-4),i));
    end
    hold off;
    title('Horizontal speeds in time');
    xlabel('t (s)');
    ylabel('dX/dt (m/s)');
    
    subplot(3,1,2);
    hold all;
    for i=1:nbPoints
        plot(t(1:length(dy(:,i))-4),dy((1:length(dy(:,i))-4),i));
    end
    hold off;
    title('Vertical speeds in time');
    xlabel('t (s)');
    ylabel('dY/dt (m/s)');

    subplot(3,1,3);
    hold all;
    for i=1:nbPoints
        plot(t(1:length(dz(:,i))-4),dz((1:length(dz(:,i))-4),i));
    end
    hold off;
    title('Depth speeds in time');
    xlabel('t (s)');
    ylabel('dZ/dt (m/s)');
    legend(legende);
    
end