@echo off


echo ******************************
echo * Iniciando limpeza
echo ******************************

echo Apagando diretorio fonte ".\src" ...
rmdir /s /q .\src

echo Apagando diretorio das classes ".\bin" ...
rmdir  /s /q .\bin


echo ******************************
echo * Preparando o ambiente
echo ******************************

echo Criando diretorio fonte ".\src" ...
mkdir .\src

echo Criando diretorio das classes ".\bin" ...
mkdir .\bin

echo preparando o pacote matematica.multiplicacao
echo dentro de ".\src"
echo o pacote acomodara a classe MinhaMultiplicacao 
mkdir .\src\matematica
mkdir .\src\matematica\multiplicacao

echo Copiando arquivo fonte 
echo para o diretório .\src\matematica\multiplicacao\
copy .\fontes\MinhaMultiplicacao.java .\src\matematica\multiplicacao\

echo Copiando arquivos fonte JuntaTudoEExecuta.java 
echo para o diretório .\src
copy .\fontes\JuntaTudoEExecuta.java .\src\

echo ******************************
echo * Iniciando compilacao
echo ******************************
echo Compilando arquivos java do diretório .\src


echo compilando multiplicacao\matematica\MinhaMultiplicacao.java
javac  .\src\matematica\multiplicacao\MinhaMultiplicacao.java

echo empacotando classe MinhaMultiplicacao 
echo dentro do pacote matematica.multiplicacao e colocando .\bin
jar cvf matematica.jar -C .\src\ matematica
mv matematica.jar .\bin\


echo e fazendo saida em .\bin
javac -cp .;.\bin\matematica.jar .\src\JuntaTudoEExecuta.java -d .\bin\

echo entrando no diretorio .\bin 
cd .\bin

echo executando...
java -cp .;matematica.jar JuntaTudoEExecuta

echo voltando a raiz ...
cd ..\







