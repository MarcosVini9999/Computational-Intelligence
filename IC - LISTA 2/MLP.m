base = fopen("assets\column_3C.dat");
C = textscan(base, '%f %f %f %f %f %f %s', 'Delimiter',',');

%Configurações
num_executions = 10; %número de execuções
training_percentage = 0.7; %Porcentagem de amostras para treino
num_hidden_layer = 30; %Tamanho da camada oculta

%Transforma a saída do dataset em um conjunto real/analógica
outputs = C{7};
categories = unique(outputs);
RealOutputs = zeros(length(outputs), length(categories));
for output = 1 : length(outputs)
    for category = 1 : length(categories)
        RealOutputs(output, category) = strcmp(outputs{output}, categories(category));
    end
end

%Conjunto de dados Vertebral Column Data set classificado em três categorias
dataset = [C{1}, C{2}, C{3}, C{4}, C{5}, C{6}, RealOutputs];

X = normalize(dataset(:, 1:6)'); % Variáveis de entrada transpostos e normalizados
Y = dataset(:, 7:9)'; %Variáveis de saída transpostos 
net = feedforwardnet(num_hidden_layer); %Alimenta a rede com 30 neurônios ocultos

%Cria um vetor de zeros do tamanho do número de excuções
accuracy = zeros(1, num_executions); 

%Loop para repetir a excução do algoritmo MLP
for execution = 1:num_executions
    %Separa as amostras para treino e para teste através da validação hold-out
    [X_train, Y_train, X_test, Y_test] = HoldOut(X, Y, training_percentage);
    
    %Treina a rede com as amostras de treino
    net = train(net, X_train, Y_train);
    
    % Uma predição é feita com os dados de teste
    prediction = net(X_test);

    % É comparado os dados de teste com a predição por meio da acurácia
    accuracy(execution) = Accuracy(Y_test, prediction);

    fprintf('Execução %d, acurácia %f\n', execution, accuracy(execution));
end

fprintf('Acurácia Média: %f\n', mean(accuracy));