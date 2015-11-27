
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

float funcao_soma1(float a, float b)
{
  float soma1=0;
  soma1= a + b;
  return soma1;
};

 void funcao_soma2 (float *c,float *d)
 {
   *c = *c + *d;

 };

main()
{ float a=0,b=0;
 printf("Informe os primeiros numeros a serem somados\n");
 scanf  ("%f",&a);
 scanf  ("%f",&b);
 printf ("\nOs numeros somados são %.2f\n",funcao_soma1(a,b));

 printf ("informe os  numeros a serem somados\n");
 float c=0,d=0;
 scanf  ("%f",&c);
 scanf  ("%f",&d);

 funcao_soma2(&c,&d);
 printf ("O valor dos numerros somados é %.2f");
 getch();

}
