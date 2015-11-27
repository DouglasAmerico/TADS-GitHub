
#include <stdio.h>
#include <conio.h>

main()

{ int cont,valor,soma = 0;
   float total;
  for (cont = 0;cont < 3;cont++)
  {
    printf ("Informe o valor numero %d\n",cont);
    scanf  ("%d",&valor);
    soma = soma + valor;
  }
  total = (soma / 3);
  printf ("A média dos valores é = %2f",total);
  getch();
}
