#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

struct estoque
{
    int codigo,e_min,e_atu,preco;
    char descricao[10];
} est;

main()
{
    int cod;
    FILE *arq_est;
    arq_est = fopen("2Estoque.txt","r+b");
    if (arq_est ==  NULL)
    {
        arq_est= fopen("2Estoque.txt","w+b");
    }

    do
    {
     fflush (stdin);
     printf ("Informe  o codigo do produto: ");
     scanf  ("%d",&cod);
     if (cod == 0) {break;}

     fflush (stdin);
     est.codigo= cod;
     printf ("Informe a descri��o do produto: ");
     gets   (est.descricao);
     printf ("Informe o estoque minimo: ");
     scanf  ("%d",&est.e_min);
     printf ("Informe oestoue atual: ");
     scanf  ("%d",&est.e_atu);
     printf ("Informe o pre�o do produto: ");
     scanf  ("%d",&est.preco);

     system ("cls");
     fwrite (&est, sizeof(est),1, arq_est);
      }
    while (est.codigo != 0);

    fclose (arq_est);

    arq_est = fopen("2Estoque.txt","r+b");
    system ("cls");

    //fseek (arq_est, 00 ,SEEK_SET);  n�o sei oq faz;
         while (fread(&est,sizeof(est),1,arq_est))
     {
         if (est.e_atu < est.e_min)
         {
         printf ("O codigo do produto � %d\n",est.codigo);
         printf ("A descri��o do produto � %s\n",est.descricao);
         printf ("O estoque minimo desse produto � %d\n",est.e_min);
         printf ("O estoque atual do produto � %d\n",est.e_atu);
         printf ("O pre�o do produto � %d\n",est.preco);
         printf ("\n");
         getch();
         }
     }

 getch();
}
