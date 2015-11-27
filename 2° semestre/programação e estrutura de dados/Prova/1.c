
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

void func(int *nasc,int *comb,int *gasto,int *n_tem,float *perc,int *menor,int *existe,int total)
{
   printf ("%daaaaaa",*menor);
   if (*nasc == 2) {*perc= *perc + 1;}
   //printf ("%.2--\n\n",*perc);
   if (*gasto < *menor) {*menor= *gasto;}
   if (*comb == 3) {*existe= 1;}

}

main()
{
    char veic;
    int cont,academicos,gasto,nasc,comb;
    int n_tem=0,menor=0,existe=0,carros=0;
    float perc=0;
    printf ("########## Pesquisa Integrado ########\n\n");

    printf ("Quantos academicos irão pasticipar da pesquisa?\n");
    scanf  ("%d",&academicos);
    getch();
    system ("cls");

    printf ("########## Pesquisa Integrado ########\n\n");
    for (cont=0;cont<academicos;++cont)
    {
     fflush(stdin);
    printf ("Possui veiculo (S/N)?\n ");
    scanf  ("%c",&veic);
    if (toupper(veic) == 'S')
    {
      printf ("O veiculo que possui é : (1- Nascinal) ou (2- Importado)? \n");
      scanf  ("%d",&nasc);
      printf ("O tipo de combustivel que o veiculo utiliza (1- Alcool),(2- Gasolina) ou (3- Flex)?\n");
      scanf  ("%d",&comb);
      printf ("Qual é o gasto mensal com o abastecimento do veiculo?\n");
      scanf  ("%d",&gasto);
      if (cont == 0) {menor= gasto;}
      printf ("-------------------------------------\n\n");

      func (&nasc,&comb,&gasto,&n_tem,&perc,&menor,&existe,academicos);
      ++carros;
    }
    else {++n_tem;}
    }
  perc= perc*100/carros;
  printf ("Foram cadastrados %d academicos que não tem carro\n",n_tem);
  printf ("O percentual de carros importados perante ao total é de %.2f%%\n",perc);
  printf ("O menor gasto mensalde abastecimento é :\n",menor);
  if (existe == 1)
  {
      printf ("Existe pelo menos 1 carro Flex\n");
  }

 getch();
}
