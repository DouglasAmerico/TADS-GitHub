#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>
#include <string.h>

main()

{

int cont, tam, c_a, c_e, c_i, c_o, c_u;
char nome[30];

// inicializei todas as variaveis com zero porque sao contadores

c_a = c_e = c_i = c_o = c_u = 0;

printf("Digite uma frase: ");
gets(nome);
tam = strlen(nome);

for (cont = 0; cont <= tam - 1; cont++)
{
  if      (toupper(nome[cont]) == 'A') c_a++;
  else if (toupper(nome[cont]) == 'E') c_e++;
  else if (toupper(nome[cont]) == 'I') c_i++;
  else if (toupper(nome[cont]) == 'O') c_o++;
  else if (toupper(nome[cont]) == 'U') c_u++;
}

printf("\n\nA frase tem:\n");
printf("\n%d letra(s) a",c_a);
printf("\n%d letra(s) e",c_e);
printf("\n%d letra(s) i",c_i);
printf("\n%d letra(s) o",c_o);
printf("\n%d letra(s) u",c_u);
printf("\n\n");

getch();

}