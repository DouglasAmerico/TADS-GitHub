#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

main()
{
 int cont=0,salario=0,filhos=0,maior=0;
 float media_sal=0,media_fil=0,perc=0;
 do
 {
  cont=cont++;
  printf ("Informe o salario da %d pessoa\n",cont);
  scanf  ("%d",&salario);
  printf ("Informe o numero de filhos da %d pessoa\n",cont);
  scanf  ("%d",&filhos);
  system("cls");

  if (salario<=3000)
     {
  media_sal= media_sal + salario;
  media_fil= media_fil + filhos;

  if (salario>maior)  maior=salario;
  if (salario<=500)   perc= perc++;
     };

   }
 while (salario<3000);
 cont= cont -1;

 printf ("\nA m�dia do salario da popula��o � %f ",(media_sal/cont));
 printf ("\nA m�dia do numero de filhos � %f ",(media_fil/cont));
 printf ("\nO maior salario � %d ",maior);
 printf ("\nO percentual de pessoas com salario abaixo de 500 RS � %f",(perc*100/cont));

 getch();
}
