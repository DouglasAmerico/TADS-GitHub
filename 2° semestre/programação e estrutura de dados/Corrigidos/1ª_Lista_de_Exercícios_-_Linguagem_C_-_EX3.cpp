#include <stdio.h>    // printf 
#include <stdlib.h>   // system("cls");
#include <conio.h>    // getch() 

main()
{
      system("cls");
      
      char nome[50];
      float salario, vendas, perc_comis, salario_final;
      
      printf("Entre com o nome do vendedor\n");
      gets(nome);
      printf("Entre com o salario do vendedor\n");
      scanf("%f", &salario);
      printf("Entre com o total de vendas do vendedor (em reais)\n");
      scanf("%f", &vendas);
      printf("Entre com o percentual de comissao sobre o total de vendas\n");
      scanf("%f", &perc_comis);
      
      salario_final = salario + ((vendas * perc_comis)/100);
      
      printf("\n\nO vendedor %s tem salario final de %.2f", nome, salario_final);
      
      getch();
}
      
      
      
      
