#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

main()

{
    printf("Informe um numero inteiro\n");
    int valor=0;
    scanf ("%d",&valor);

    printf("Informe o numero a ser elevado\n");
    int ele=0;
    scanf ("%d",&ele);

    int total,cont;
    if (ele==0) total=0;
    else if (ele==1)  total=valor;
          else if (ele>0) {for (cont=1;cont<ele;cont++)

                               total= total * total;
                           }
                else {for (cont=1;cont<ele;cont++)
                       {total=total * total;};

                      total= (total* -1);
                      };

   printf ("O resultado da elevação é = %d",total);
}
