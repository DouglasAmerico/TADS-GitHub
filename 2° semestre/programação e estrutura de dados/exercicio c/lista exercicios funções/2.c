#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

float calc(float raio)
{
  return (4/3 * raio * raio * raio);

}
main()
{ float raio=0;
  printf ("Informe o raio\n");
  scanf  ("%f",&raio);
  printf ("O valor é %.2f ",calc(raio));
getch();
}
