#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define tam 4

void func_duplicata(int vetor,int dim)
{
    int cont=0,cont2=0;
       for(cont=0;cont<dim;cont++)
        {if ((cont % 2) == 0)
        {
          for (cont2=0;cont2<10;cont2++)
        {
            if (vetor[cont2] == cont2) {vetor[cont2]= (vetor[cont2] * 10);}
        }
         }
          }
}

main()
{
int vetor[tam],cont=0,cont2=0,cont3=0,cont4=0;

for(cont=0;cont<10;cont++)
{
    for (cont2=0;cont2<10;cont2++)
    {
        for (cont3=0;cont3<10;cont3++)
        {
            for (cont4=0;cont4<10;cont4++)
            {
                vetor[0]= cont; vetor[1]=cont2; vetor[2]=cont3; vetor[3]=cont4;
                // Atribuição dos valores conectando cada digito a cada posição do vetor;
                func_duplicata(vetor,tam);
            }
        }
    }
}
getch();
}
