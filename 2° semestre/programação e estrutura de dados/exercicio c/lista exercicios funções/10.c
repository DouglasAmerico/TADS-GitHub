#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (int *maior)
{
 int num=0;

 do
  printf ("Informe o numero");
  scanf  ("%d",&num);
  if (num > *maior) *maior= num;
 while (num != 0);

};

main()
{
 int maior=0;
 func (&maior);
 printf ("O maior valor é %d",maior);
}
