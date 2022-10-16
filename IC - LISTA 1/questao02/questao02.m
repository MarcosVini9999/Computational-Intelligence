function questao02(grau)
base = importdata("assets\aerogerador.dat");

%velocidade do vento
vel_vento = base(:, 1);
%potência gerada
potencia = base(:, 2);

%plotagem do aerogerador
plot(vel_vento, potencia, '.');
hold on;

%quantidade de amostras
num_amostras = length(vel_vento);

%Função que retorna a matriz dos valores independentes
function X = matriz_X(num_amostras, vel_vento, grau)
    switch grau
        case 2
            X = [ones(1, num_amostras)' vel_vento vel_vento.^2];
        case 3
            X = [ones(1, num_amostras)' vel_vento vel_vento.^2 vel_vento.^3];
        case 4
            X = [ones(1, num_amostras)' vel_vento vel_vento.^2 vel_vento.^3 vel_vento.^4];
        case 5
            X = [ones(1, num_amostras)' vel_vento vel_vento.^2 vel_vento.^3 vel_vento.^4 vel_vento.^5];
        case 6
            X = [ones(1, num_amostras)' vel_vento vel_vento.^2 vel_vento.^3 vel_vento.^4 vel_vento.^5 vel_vento.^6];
        case 7
            X = [ones(1, num_amostras)' vel_vento vel_vento.^2 vel_vento.^3 vel_vento.^4 vel_vento.^5 vel_vento.^6 vel_vento.^7];
    end
end

% vetor dos valores de beta
% barra invertida para precisão de cálculo
beta_chap = (matriz_X(num_amostras, vel_vento, grau)' * matriz_X(num_amostras, vel_vento, grau)) \ (matriz_X(num_amostras, vel_vento, grau)' * potencia);

%Função de regressão múltipla
y_chap = matriz_X(num_amostras, vel_vento, grau)*beta_chap;

% Coeficiente de determinação
R2 = 1 - (sum((potencia - y_chap).^2)) / (sum((potencia - mean(potencia)).^2));
fprintf('R2 = %f\n', R2);

% Coeficiente de determinação ajustado
p = grau + 1; 
R2_AJ = 1 - ((sum((potencia - y_chap).^2)) / (potencia - p)) / ((sum((potencia - mean(potencia)).^2)) / (num_amostras-1));
fprintf('R2AJ = %f\n', R2_AJ);
end