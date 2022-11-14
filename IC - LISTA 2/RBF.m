% Leitura do arquivo
base = fopen("assets\column_3C.dat");
C = textscan(base, '%f %f %f %f %f %f %s', 'Delimiter',',');


%Configurações
trainingPercentage = 0.7; %percentual de amostras para treinamento/testes
q = 15; % Quatidade de neurônios na Camada Oculta 
sigma = 25; % valor para o desvio padrão dos pesos da camada oculta
num_executions = 10; %número de execuções


%Transforma a saída do dataset em um conjunto real/analógica
outPuts = C{7};
categories = unique(outPuts);
RealOutputs = zeros(length(outPuts), length(categories));
for output = 1 : length(outPuts)
    for category = 1 : length(categories)
        RealOutputs(output, category) = strcmp(outPuts{output}, categories(category));
    end
end

%Conjunto de dados Vertebral Column Data set classificado em três categorias
dataset = [C{1}, C{2}, C{3}, C{4}, C{5}, C{6}, RealOutputs];

X = normalize(dataset(:, 1:6)'); % Variáveis de entrada transpostos e normalizados
Y = dataset(:, 7:9)'; %Variáveis de saída transpostos

%Cria um vetor de zeros do tamanho do número de excuções
accuracy = zeros(1, num_executions);

for execution = 1:num_executions
    %Separa as amostras para treino e para teste através da validação hold-out
    [X_train, Y_train, X_test, Y_test] = HoldOut(X, Y, trainingPercentage);

    %Calculo da matriz de pesos
    [p, ~] = size(X_train);
    w = randn(p,q);

    %Prevê com as amostras de treinamento
    [~, num_samples] = size(X_train);
    Z = zeros(q, num_samples);
    for sample = 1 : num_samples
        for neuron = 1 : q
            centroid = w(:, neuron);
            x = X_train(:, sample);
            u = norm(x - centroid); 
            fu = exp(-u .^ 2 / (2 * sigma .^ 2));
            Z(neuron, sample) = fu;
        end
    end
    Z = bias_addition(Z);
    M = mrdivide((Y_train * Z'), (Z * Z'));


    %Prevê com as amostras de teste
    [~, num_samples] = size(X_test);
    Z = zeros(q, num_samples);
    for sample = 1 : num_samples
        for neuron = 1 : q
            centroid = w(:, neuron);
            x = X_test(:, sample);
            u = norm(x - centroid);
            fu = exp(-u .^ 2 / (2 * sigma .^ 2));
            Z(neuron, sample) = fu;
        end
    end
    Z = bias_addition(Z);
    prediction = M * Z;

    %Calcula a precisão da previsão  
    accuracy(execution) = Accuracy(Y_test, prediction);

    fprintf('Execução %d, acurácia %f\n', execution, accuracy(execution));
end

fprintf('Acurácia Média: %f\n', mean(accuracy));

function output = bias_addition(x0)
    [~, n] = size(x0);
    output = [1 * ones(1, n); x0];
end