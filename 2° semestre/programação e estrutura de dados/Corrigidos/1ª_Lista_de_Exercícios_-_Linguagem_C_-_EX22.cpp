#include <stdlib.h>
#include <conio.h>
#include <stdio.h>

main()

{

  int cont;

  system("cls");
  printf("Apresentando o resultado utilizando o laco de repeticao PARA\n");
  printf("------------------------------------------------------------\n");
  for (cont = 1; cont <= 10; cont++)
    printf("\nPROGRAMACAO E ESTRUTURA DE DADOS");

  printf("\n");
  
  getch();

  system("cls");
  printf("Apresentando o resultado utilizando o laco de repeticao ENQUANTO\n");
  printf("----------------------------------------------------------------\n");
  cont = 0;
  while (cont < 10)
  {
    printf("\nPROGRAMACAO E ESTRUTURA DE DADOS");
    ++cont;
  }

  printf("\n");

  getch();
  
  system("cls");
  printf("Apresentando o resultado utilizando o laco de repeticao REPITA\n");
  printf("--------------------------------------------------------------\n");
  cont = 0;
  do
  {
    printf("\nPROGRAMACAO E ESTRUTURA DE DADOS");
    ++cont;
  } while (cont < 10);

  printf("\n");

  getch();

}
