# Computational-Intelligence

## Lista 1

- Construa um programa baseado em lógica fuzzy (inferência de Mamdani) conforme
as regras disponibilizadas no Exercício 18 do livro “Inteligência Computacional
Aplicada à Administração, Economia e Engenharia em Matlab”, Hime Aguiar e
Oliveira Junior (Coordenadores), Caldeira, A. M.; Machado, M. A. S.; Sousa, R. C.;
Tanscheit, R.; Thomson Learning, 2007. O programa deverá solicitar as entradas ao
usuário e exibir a saída produzida.

- Usando o conjunto de dados do aerogerador (variável de entrada: velocidade do vento 
m/s, variável de saída: potência gerada – kWatts), determine os modelos de regressão
polinomial (graus 2 a 7) com parâmetros estimados pelo método dos mínimos
quadrados.
Avalie a qualidade de cada modelo pela métrica R2 e R2
aj (equações 48 e 49, slides sobre
Regressão Múltipla).

- Dada a base de dados abaixo, na qual a primeira e segunda colunas são as variáveis
regressoras (x1 e x2) e a terceira coluna é a variável dependente (y), determine o modelo
de regressão múltipla (plano) com parâmetros estimados pelo método dos mínimos
quadrados. Avalie a qualidade do modelo pela métrica R2. 

## Lista 2

- Classifique o conjunto de dados Vertebral Column Data set (disponível em
(https://archive.ics.uci.edu/ml/datasets/Vertebral+Column) usando as redes neurais
MLP e RBF. Utilize a estratégia de validação hold-out (70% das amostras para treino e
o restante para teste) e efetue 10 execuções. O resultado deve ser a acurácia média.
Obs.: É permitido usar funções já disponíveis para a rede neural MLP. A rede RBF
deverá ser implementada.

## Lista 3

- Crie um algoritmo genético para o problema do caixeiro viajante representado por
um grafo completo não direcionado de 14 vértices (cidades) cuja matriz de adjacência,
que representa as distâncias entre as cidades, é:

  ### <img src="https://user-images.githubusercontent.com/66041553/207482308-de4407e9-eb29-43ec-b8f7-d761326371f5.png" width="500px"></img>

O algoritmo deve exibir o melhor caminho encontrado e o seu custo de percurso. Use
crossover de mapeamento parcial e mutação por permutação de elementos.
