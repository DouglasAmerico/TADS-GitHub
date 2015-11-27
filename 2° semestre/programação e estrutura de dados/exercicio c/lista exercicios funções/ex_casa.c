#include<stdio.h>
#define DIML 5
#define DIMC 40
main()
{
     int i, j;
     char nomes[DIML][DIMC];
     for (i=0; i<DIML; i++)
     {
         printf("Entre com a linha %d", i);
         gets(nomes[i]);
     }
     for (i=0; i < DIML; i++)
     {
         printf("O nome %d e\n", i);
         puts(nomes[i]);
     }
}
