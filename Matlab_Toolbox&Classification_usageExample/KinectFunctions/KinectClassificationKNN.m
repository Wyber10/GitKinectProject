function [classes,IDX,distance,threshold] = KinectClassificationKNN(learningData,learnedClasses,testData,epsilon,K)
    % This function is a classifier that uses the method of K nearest 
    % neighbors to find, into the class that the function receives, the 
    % class in which the test data go. For this, the function receives the
    % learning data matrix and the classes vector. Then with the test set 
    % matrix and the number of neighbors K, and threshold epsilon, it
    % predicts which one is the class for each one into the test set.
    
    % Test of the number of arguments
    if nargin < 5
        K = 1;
    end
    
    [IDX,distance] = knnsearch(learningData,testData,'K',K);

    classes = zeros(length(testData(:,1)),1); % Initialisation of local variables
    tmpClasses = zeros(1,K);
    d = zeros(1,K);

    threshold = min(min(distance)) + epsilon; % threshold adaptation to prevent from abuses
    if threshold >= 0.6*max(max(distance))
        threshold = 0.6*max(max(distance));
    elseif max(max(distance)) < 1
        threshold = threshold/1.7; 
    end

    for i = 1:length(testData(:,1)) % Processing
        for j = 1:K
            tmpClasses(j) = learnedClasses(IDX(i,j));
            d(j) = meanDistClass(tmpClasses(j),tmpClasses,distance(i,:));
        end

        [d , class] = min(d);

        if d < threshold
            classes(i,1) = tmpClasses(class);
        else
            classes(i,1) = 0;
        end
    end 
end

