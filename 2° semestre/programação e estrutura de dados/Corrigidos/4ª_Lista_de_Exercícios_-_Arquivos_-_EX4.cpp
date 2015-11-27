#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
       char nome_cidade[50];
       char uf_cidade[3];
       int  populacao_cidade;
       char regiao_cidade[30];
} cidade;

main()
{
      FILE *arq_municipio;
      cidade municipio;
      int qtde_municipios, cont, maior_pop;
      char municipio_maior_pop[50];
      char estado_maior_pop[3];
      char regiao_maior_pop[30];

      arq_municipio = fopen("cidades.dad", "r+b");

      if (arq_municipio == NULL) arq_municipio = fopen("cidades.dad", "w+b");

      printf("Informe a quantidade de municipios a serem cadastrados\n");
      scanf("%d", &qtde_municipios);

      for (cont = 1; cont <= qtde_municipios; ++cont)
      {
          printf("Entre com o nome do municipio\n");
          scanf("%s", &municipio.nome_cidade);

          printf("Entre com a unidade federativa do municipio\n");
          scanf("%s", &municipio.uf_cidade);
          strupr(municipio.uf_cidade);

          printf("Entre com o nome da regiao do municipio\n");
          scanf("%s", &municipio.regiao_cidade);

          printf("Entre com a populacao do municipio\n");
          scanf("%d", &municipio.populacao_cidade);

          fwrite(&municipio, sizeof(cidade), 1, arq_municipio);
      }

      fclose(arq_municipio);

      arq_municipio = fopen("cidades.dad", "r+b");

      maior_pop = 0;

      while (fread(&municipio, sizeof(cidade), 1, arq_municipio))
      {
         if (strcmp(municipio.uf_cidade, "GOIAS") == 0)
         {
            printf("\nMunicipio --> %s", municipio.nome_cidade);
            printf("\nEstado    --> %s", municipio.uf_cidade);
            printf("\nRegiao    --> %s", municipio.regiao_cidade);
            printf("\nPopulacao --> %d", municipio.populacao_cidade);
            printf("\n--------------------------------------\n");
            getch();
         }

         if (municipio.populacao_cidade > maior_pop)
         {
            strcpy(municipio_maior_pop, municipio.nome_cidade);
            strcpy(estado_maior_pop   , municipio.uf_cidade);
            strcpy(regiao_maior_pop   , municipio.regiao_cidade);
            maior_pop = municipio.populacao_cidade;
         }
      }

      system ("cls");

      printf ("\n\nDados do Municipio com a Maior Populacao\n");
      printf ("\nMunicipio --> %s", municipio_maior_pop);
      printf ("\nEstado    --> %s", estado_maior_pop);
      printf ("\nRegiao    --> %s", regiao_maior_pop);
      printf ("\nPopulacao --> %d", maior_pop);

      getch();
}

