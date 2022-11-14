function [X_train, Y_train, X_test, Y_test] = HoldOut(X, Y, training_percentage)
    [num_var, num_samples] = size(X);
    [num_outputs, ~] = size(Y);

    testing_percentage = 1 - training_percentage;
    num_testing_samples = round(testing_percentage * num_samples);

    %Amostras de treino embaralhados
    X_train = X(:, randperm(length(X)));
    Y_train = Y(:, randperm(length(X)));
    
    %Cria uma matriz de zeros para guardar as amostras de teste
    X_test = zeros(num_var, num_testing_samples);
    Y_test = zeros(num_outputs, num_testing_samples);
    
    for i = 1 : num_testing_samples
        Y_test(:, i) = Y_train(:, i);
        X_test(:, i) = X_train(:, i);
        
        X_train(:, i) = [];
        Y_train(:, i) = [];
    end
end

