function [] = KinectTimeAngAccPlot(t,dTheta2,nbAngles,legendeAngle)
    % Plot the angle acceleration in time with legend

    figure;
    hold all;
    for i=1:nbAngles
        plot(t(1:length(dTheta2(:,i))-4),dTheta2((1:length(dTheta2(:,i))-4),i));
    end
    hold off;
    title('Angular accelerations in time');
    xlabel('t (s)');
    ylabel('d^2\Theta/dt^2 (Deg/s^2)');
    legend(legendeAngle);

end
