/* 
Esse exercicio tem o intuito de informar as principais 
bibliotecas, comandos e estruturas contidas na linguagem C
*/

#include <conio.h>  // biblioteca necessaria para o uso das funções clrscr e getch
#include <stdio.h>  // biblioteca necessaria para o uso da funcao printf
#include <math.h>   // biblioteca necessaria para o calculo de expressoes numericas
#include <string.h> // biblioteca necessaria para o trabalho com cadeia de caracteres
#include <stdlib.h> // biblioteca necessaria para alocacao de memoria, controle de processos e conversoes

main()

{

char frase[50];
int pos;

clrscr();    // funcao para limpar a tela


printf("Entre com uma frase qualquer\n");
gets(frase);
printf("\n\n");

// ------------------------------------------------------------------------
// lembrando que a primeira posicao de uma string comeca na posicao zero
// ------------------------------------------------------------------------


// ------------------------------------------------------------------------
// utilizando o laco for
// ------------------------------------------------------------------------
printf("As letras nas posicoes impares sao: ");

for(pos = 0; pos <= strlen(frase) - 1; pos = pos + 2) 
{
printf("%c", frase[pos]);
}

printf(" (FOR)");

getch();


// ------------------------------------------------------------------------
// utilizando o laco while
// ------------------------------------------------------------------------
printf("\nAs letras na posicoes impares sao: ");

pos = 0;
while (pos <= strlen(frase) - 1)
{
printf("%c", frase[pos]);
pos = pos + 2;
}

printf(" (WHILE)");


getch();    // aguarda que uma tecla seja pressionada


// ------------------------------------------------------------------------
// utilizando o laco do while
// ------------------------------------------------------------------------
printf("\nAs letras nas posicoes impares sao: ");

pos = 0;
do
{
printf("%c", frase[pos]);
pos = pos + 2;
}
while (pos <= strlen(frase) - 1);

printf(" (DO WHILE)");

getch();    // aguarda que uma tecla seja pressionada

}