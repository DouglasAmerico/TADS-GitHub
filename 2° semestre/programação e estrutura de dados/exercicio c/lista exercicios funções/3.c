#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

int funcao(int q)
{
 int cont=0,num,maior=0;

 for (cont=0;cont<q;cont++)
  {
   printf ("Informe o %d numero\n",(cont+1));
   scanf  ("%d",&num);
   system("cls");
    if (num>maior) maior=num;
   }
  return maior;
}
main()
{
    int q=0;
    printf ("Informe quantos numeros serão lidos\n");;
    scanf ("%d",&q);
    system ("cls");
    printf ("O maior valor é %d ",funcao(q));

    getch();
}
