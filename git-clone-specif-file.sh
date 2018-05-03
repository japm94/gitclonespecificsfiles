#!/bin/bash

while true; do
    read -p "Você deseja clonar um arquivo específico de um repositório? " sn
    case $sn in
        [Ss]* ) echo -e "Claro que sim, minha função é essa ABESTADO!\nEspera aí...";sleep 2;break;;
        [Nn]* ) exit;;
        * ) echo "Tá difícil aí fera? Cadê o supletivo? Por favor digite S ou N.";;
    esac
done

while true; do
read -p "Digite o nome da pasta do repositório: " directoryName
    if [ -z $directoryName ]; then
        echo "Não pode ser nulo";sleep 2;
    else
        echo -e "Mizeravi! Acertou! Quem te ensinou?\nTô criando...";
        mkdir $directoryName;sleep 2;break;
    fi
done

echo "Entrando na pasta..."
cd $directoryName

echo "Inicializando repositório"
git init

read -p "Digite o nome do da branch que você deseja pegar o arquivos: " branchName
read -p "Cole aqui a URL do repositório: " repoUrl
read -p "Digite o nome dos arquivos que você deseja: " fileName
echo "Sincronizando com repositório remoto..."
git remote add $branchName $repoUrl
IFS=" " read -ra FILES <<< "$fileName"
for file in "${FILES[@]}"; do
    echo $file >> .git/info/sparse-checkout
done
git config core.sparsecheckout true
echo -ne '#####                     (33%)\r'
sleep 1
git pull $branchName
echo -ne '#############             (66%)\r'
sleep 2
git checkout $branchName
sleep 2
echo -ne '#######################   (100%)\r'
echo -ne '\n'
sleep 1
echo "Ta pronto fera!"