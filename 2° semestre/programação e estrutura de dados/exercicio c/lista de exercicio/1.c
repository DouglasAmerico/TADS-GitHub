#include <stdio.h>
#include <conio.h>

main()

{
  float salario, perc, total;

  printf ("Informe seu salario atual\n");
  scanf  ("\n%f",&salario);

  printf ("Informe o precentual de reazuste\n");
  scanf  ("%f",&perc);

  total = salario + (salario/100*perc);

  printf ("O novo salario é correspondente a %.2f",total);
  getch();

}
