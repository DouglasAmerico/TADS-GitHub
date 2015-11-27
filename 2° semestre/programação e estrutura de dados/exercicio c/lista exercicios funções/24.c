
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define l 3
#define c 3

void func  (int matriz[l][c],int lin,int *menor)
{
    int cont=0;
    *menor = matriz[0][0];
    for (cont=0;cont<lin;cont++)
    {
      if (matriz[cont][cont] < *menor) *menor= matriz[cont][cont];
    }

}

main()
{
    int cont=0,cont2=0,matriz[l][c],menor=0;
    for (cont=0;cont<l;cont++)
    {
      for (cont2=0;cont2<c;cont2++)
        {
            printf ("Informe o valor da linha %d coluna %d\n",cont+1,cont2+1);
            scanf  ("%d",&matriz[cont][cont2]);
        }
        system ("cls");
    }
    func (matriz,l,&menor);
    printf ("O menor elemento da diagonal princippal da matriz é %d\n",menor);
    getch();
}
