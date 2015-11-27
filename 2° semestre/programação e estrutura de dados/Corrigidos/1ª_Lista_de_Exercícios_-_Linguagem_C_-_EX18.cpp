#include <stdlib.h> // system("cls")
#include <stdio.h>  // printf()
#include <conio.h>  // getch()

main()
{
      system("cls");
      
      float salario, reajuste;
      
      printf("Entre com o salario do funcionario\n");
      scanf("%f", &salario);
      if      (salario <= 800)  salario = salario * 1.10;
      else if (salario <= 1500) salario = salario * 1.075;
      else                      salario = salario * 1.05;
      
      printf("Salario Reajustado -> %.2f", salario);
      
      getch();
}
