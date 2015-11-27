#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

main()

{

int pos, y, tam;
char frase[30];

system("cls");
printf("Digite uma palavra: ");
gets(frase);
tam = strlen(frase);

printf("\nPalavra de tras pra frente -> ");

for (pos = tam - 1; pos >= 0; pos--)
   printf("%c", frase[pos]);

printf("\n\n");

getch();

}
