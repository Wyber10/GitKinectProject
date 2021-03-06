function [] = KinectSpacePlot(X,Y,Z,nbPoints,legende)
    % Plot the position in 3D space

    figure;
    hold all;
    for i=1:nbPoints
        plot3(X(:,i),Z(:,i),Y(:,i),'LineWidth',1.25);
    end
    hold off;
    xlabel('x');
    ylabel('z');
    zlabel('y');
    legend(legende);
    grid on;
    view (3), rotate3d on;
    
end

