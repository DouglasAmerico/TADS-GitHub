#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

int soma_inter(int p_num1, int p_num2)
{
     int soma, cont;
     soma = 0;
     for (cont = p_num1; (cont <= p_num2); ++cont)
     {
         soma += cont;
     }
     return(soma);
}     

main()
{
      int num1, num2, s;
      printf("Entre com dois numeros inteiros positivos\n");
      scanf("%d%d", &num1, &num2);      
      s = soma_inter(num1, num2);
      printf("\nSoma dos numeros entre %d e %d -> %d", num1, num2, s);
      getch();
}
