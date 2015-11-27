#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

main()

{
  printf ("Informe quantos numeros vai querer informar   ");
  int cont,qn=0,num,maior=0,menor=0,soma=0,superior=0;
  float porc=0,media=0;

  scanf  ("%d",&qn);
  system ("cls");

  for (cont=0;cont<qn;cont++)
  {
    printf ("Informe o numero de posição %d\n",cont+1);
    scanf  ("%d",&num);
    if (cont==0) {maior= num; menor= num;};
    soma= soma + num;

    if (num>maior) maior= num;
    else if (num<menor) menor= num;

    if (num>100) porc= porc + 1;
    else if (num>50) media= media + 1;

    if (num>10) superior= superior + 1;

   };
  if (porc != 0) porc= (porc*100/qn);
  media= soma/qn;

  printf ("\nO maior valor é %d",maior);
  printf ("\nO menor valor é %d",menor);
  printf ("\nA soma dos numeros é %d",soma);
  printf ("\nContem %d numeros superiores a 10",superior);
  printf ("\nA porcentagem dos numeros superiores a 50 é de %f %",porc);
  printf ("\nA media dos numeros superiores a 100 é %f",media);

}
