#include <stdio.h> 
#include <conio.h> 
#include <stdlib.h>

main()
{
      system("cls");
      
      float salario, perc_ad1, perc_ad2, perc_ad3, salario_final;
      int anos, num_filhos;
      
      printf("Entre com o salario do funcionario\n");
      scanf("%f", &salario);
      printf("Entre com a quantidade de anos que o funcionario trabalha na empresa (valor inteiro)\n");
      scanf("%d", &anos);
      printf("Entre com o salario do funcionario\n");
      scanf("%d", &num_filhos);
      
      perc_ad1      = (anos / 5) * 5;
      perc_ad2      = anos;
      perc_ad3      = num_filhos * 3;
      
      salario_final = salario + (salario * (perc_ad1 + perc_ad2 + perc_ad3) / 100);
      
      printf("Salario final do funcionario -> %.2f", salario_final);
      
      getch();
}
      
