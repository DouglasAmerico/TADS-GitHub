
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define fix 10

void func(int x[],int a[],int b[],int tam)

{
  int cont=0;

  for (cont=0;cont< tam;cont++)
  {
    if ((x[cont] % 2) == 0) {a[cont] = x[cont];}
    else {a[cont] = 0; };
    if ((x[cont] % 2) == 1) {b[cont] = x[cont];}
    else {b[cont] = 0; };
  };
}

main()
{
  int x[fix],a[fix],b[fix],cont;

  for(cont=0;cont< fix;cont++)
  {
      printf ("Informe o %d numero\n",cont+1);
      scanf  ("%d",&x[cont]);
  };
 func (x,a,b,fix) ;

 for (cont=0;cont< fix;cont++)
 {if (a[cont] != 0) {printf ("Os numeros pares são %d\n",a[cont]);}
 }

 for (cont=0;cont< fix;cont++)
 { if (b[cont] != 0) {printf ("Os numeros impares são %d\n",b[cont]);}
 }
}

