#!/bin/bash

# Função para realizar cálculos
# Essa função agrupa os códigos em um bloco, possibilitando reutilizar durante a execução do script
calcular() {
    local numero1=$1
    local numero2=$2
    local opcao=$3
# A palavra local indica que a variável so existe dentro dessa função
# $1, $2 e $3 são parâmetros

    case $opcao in     # Utilizado para executar o bloco  # $((...)) permite realizar operações  no shell
        1) echo $(($numero1 + $numero2)) ;;   # Adição
        2) echo $(($numero1 - $numero2)) ;;   # Subtração
        3) echo $(($numero1 * $numero2)) ;;   # Multiplicação
        4) 
            if [ $numero2 -eq 0 ]; then      # Verificar divisão por zero
                echo "Erro: Divisão por zero!"
            else
                echo $(($numero1 / $numero2))
            fi
            ;;
        *) echo "Operação inválida!" ;;      # Opção inválida  # *) usado quando nenhuma opção anterior foi atendida
    esac
}

# Loop para realizar operações infinitas
while true; do  # while true; do ... done cria um loop infinito em dash
    echo "Digite o primeiro número:"
    read -r num1

    echo "Digite o segundo número:"
    read -r num2

    echo "Escolha a operação que deseja realizar:"
    echo "1 - Adição"
    echo "2 - Subtração"
    echo "3 - Multiplicação"
    echo "4 - Divisão"
    echo "5 - Sair"
    read -r opcao  # read armazena a informação em uma variável   # a palavra echo é utilizada ma imprimir texto

    # Opção para sair do programa
    if [ "$opcao" -eq 5 ]; then
        echo "Saindo do programa."
        break
    fi

    # Chama a função calcular e exibe o resultado
    resultado=$(calcular "$num1" "$num2" "$opcao")
    echo "O resultado é: $resultado"
    echo "--------------------------------"
done    # while ... done para repetição de tarefa
