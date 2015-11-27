#include <stdio.h>     // necessario para usar a funcao printf
#include <conio.h>     // necessario para a funcao getch
#include <stdlib.h>    // necessario para o comando que limpa a tela
#include <ctype.h>     // necessario para a funcao toupper
#include <string.h>    // necessario para a funcao strupr -> converter string em MAISCULA

main()                 // funcao pelo qual o programa comeca a ser executado

{
  char nome[30], sexo;
  int idade;

  system("cls");

  printf("Informe o nome do individuo\n");
  gets(nome);
  strupr(nome);
  printf("Informe o sexo\n");
  scanf("%c", &sexo);
  printf("Informe a idade\n");
  scanf("%d", &idade);

  if ((toupper(sexo) == 'F') && (idade < 25))
	  printf("\n%s%s\n\n", nome, " (mulher com menos de 25 anos)");
  else
	  printf("\n%s%s\n\n", nome, " (homem ou mulher acima de 25 anos)");

  getch();

}

