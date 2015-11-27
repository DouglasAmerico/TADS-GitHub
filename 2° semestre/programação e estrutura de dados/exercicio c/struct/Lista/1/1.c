#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>
#define atual 2013

struct veiculos
{
    char placa[7],marca[20],modelo[20];
    int ano,preco,num_reg;
} desc;

main()
{
  FILE *arq_veic;
  char resp;
  int cont=0,cont2;

  arq_veic= fopen("1Veiculos.txt","r+b");
  if (arq_veic == NULL)
  {
    arq_veic= fopen("1Veiculos.txt","w+b");
  }

  do
  {
   cont++;
   printf ("Informe a placa do veiculo: ");
   scanf  ("%s",&desc.placa);
   fflush(stdin);
   printf ("Informe a marca do veiculo: ");
   scanf  ("%s",&desc.marca);
   fflush(stdin);
   printf ("Informe o modelo do veuculo: ");
   scanf  ("%s",&desc.modelo);
   fflush(stdin);
   printf ("Informe o ano de fabrição do veiculo: ");
   scanf  ("%d",&desc.ano);
   fflush(stdin);
   printf ("Informe o preco do veiculo: ");
   scanf ("%d",&desc.preco);
   fflush(stdin);
   desc.num_reg= cont;
   fwrite (&desc, sizeof(desc),1,arq_veic);

   fflush (stdin);
   printf ("\nIncluir novo veiculo? (S/N): ");
   scanf  ("%c",&resp);
   resp = toupper(resp);
  }
  while (resp == 'S');

 // printf ("%d--",cont);

  fclose (arq_veic);

  int cont_vol=0;
  float medio=0,porcen=0;

  arq_veic= fopen ("1Veiculos.txt","r+b");

  while (fread(&desc,sizeof(desc),1,arq_veic))
  {
    if (strupr(desc.marca) == "VOLKSWAGEN") {cont_vol++;}
    medio= medio + desc.preco;
    if ((atual - desc.ano) < 5) {porcen++;}
  }
   medio= medio/cont;


   porcen= porcen*100/cont;

   printf ("Existem %d carros da marca VOLKSWAGEN cadastrados\n",cont_vol);
   printf ("A media de preços dos carros cadastrados é de %.2f\n",medio);
   printf ("A pocentagem de carros mais novos que 5 anos é de %.2f%% em realação ao total\n",porcen);

  fclose (arq_veic);
  getch();
}
