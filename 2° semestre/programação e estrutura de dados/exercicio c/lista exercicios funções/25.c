#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

int func (int a)
{
  switch(a)
  {
   case 1:
   printf ("Janeiro");
   break;
   case 2:
   printf ("Fevereiro");
   break;

   case 3:
   printf ("Março");
   break;
      case 4:
   printf ("Abril");
   break;
      case 5:
   printf ("Maio");
   break;
      case 6:
   printf ("Junho");
   break;
      case 7:
   printf ("Julho");
   break;
      case 8:
   printf ("Agosto");
   break;
      case 9:
   printf ("Setembro");
   break;
      case 10:
   printf ("Outubro");
   break;
      case 11:
   printf ("Novenbro");
   break;
      case 12:
   printf ("Dezembro");
   break;

   default:
   printf  ("Mês Desconhecido");
   }

}

main()
{
    printf ("Informe o numero a ser consultado\n");
    int num=0;
    scanf("%d",&num);
    func (num);
    getch();
}
