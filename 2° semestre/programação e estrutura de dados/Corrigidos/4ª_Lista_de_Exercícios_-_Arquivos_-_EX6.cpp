#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

struct veiculo
{
  char  vei_placa[10];
  char  vei_modelo[35];
  int   vei_num_eixos;
  char  vei_cor[25];
  int   vei_num_portas;
  int   vei_ano;
  char  vei_flag_carga;
  float vei_valor_compra;
  float vei_valor_atual;
} carro;

main()

{
 char opcao;
 int cont_portas_vei_mais_6eixos, cont_vei_mais_6eixos, cont_vei_mais_10anos, cont_vei;
 float valor_deprec = 0, media_portas, perc_10anos;
 FILE *arq_vei;

 cont_portas_vei_mais_6eixos = cont_vei_mais_6eixos = cont_vei_mais_10anos = cont_vei = 0;

 arq_vei = fopen("dados.dat", "r+b");
 if (arq_vei == NULL)
 {
   arq_vei = fopen("dados.dat", "w+b");
 }

 do
  {
   system("cls");

   printf("DIGITE A PLACA DO VEICULO..............: ");
   scanf("%s", &carro.vei_placa);
   printf("DIGITE O MODELO DO VEICULO.............: ");
   scanf("%s", &carro.vei_modelo);
   printf("DIGITE O NUMERO DE EIXOS DO VEICULO....: ");
   scanf("%d", &carro.vei_num_eixos);
   printf("DIGITE A COR DO VEICULO................: ");
   scanf("%s", &carro.vei_cor);
   printf("DIGITE O NUMERO DE PORTAS DO VEICULO...: ");
   scanf("%d", &carro.vei_num_portas);
   printf("DIGITE O ANO DO VEICULO................: ");
   scanf("%d", &carro.vei_ano);
   printf("VEICULO DE CARGA (S)SIM OU (N)NAO?.....: ");
   scanf("%s", &carro.vei_flag_carga);
   toupper(carro.vei_flag_carga);
   printf("DIGITE O VALOR DE COMPRA DO VEICULO....: ");
   scanf("%f", &carro.vei_valor_compra);
   printf("DIGITE O VALOR ATUAL DO VEICULO........: ");
   scanf("%f", &carro.vei_valor_atual);

   fwrite(&carro, sizeof(carro), 1, arq_vei);

   printf("DESEJAR CADASTRAR OUTRO CARRO? DIGITE (S)SIM OU (N)NAO: ");
   scanf("%s", &opcao);

  } while (toupper(opcao) == 'S');

  fclose(arq_vei);

  arq_vei = fopen("dados.dat", "r+b");
  while (fread(&carro, sizeof(carro), 1, arq_vei))
  {
   ++cont_vei;

   if (carro.vei_num_eixos > 6)
   {
     cont_portas_vei_mais_6eixos += carro.vei_num_portas;
     ++cont_vei_mais_6eixos;
   };

   if ((2012 - carro.vei_ano) > 10)
   {
     ++cont_vei_mais_10anos;
   };

   valor_deprec += (carro.vei_valor_compra - carro.vei_valor_atual);

   if (carro.vei_flag_carga == 'S')
   {
    carro.vei_flag_carga = 'N';
    fseek(arq_vei, sizeof(carro) * (cont_vei - 1), SEEK_SET);
    fwrite(&carro, sizeof(carro), 1, arq_vei);
    fseek(arq_vei, sizeof(carro) * cont_vei, SEEK_SET);
   };
  };

  fclose(arq_vei);

  arq_vei = fopen("dados.dat", "rb");
  while (fread(&carro, sizeof(carro), 1, arq_vei))
  {
   system("cls");

   printf("PLACA DO VEICULO..............: ");
   printf("%s\n", carro.vei_placa);

   printf("MODELO DO VEICULO.............: ");
   printf("%s\n", carro.vei_modelo);

   printf("NUMERO DE EIXOS DO VEICULO....: ");
   printf("%d\n", carro.vei_num_eixos);

   printf("COR DO VEICULO................: ");
   printf("%s\n", carro.vei_cor);

   printf("NUMERO DE PORTAS DO VEICULO...: ");
   printf("%d\n", carro.vei_num_portas);

   printf("ANO DO VEICULO................: ");
   printf("%d\n", carro.vei_ano);

   printf("CARGA (S)SIM OU (N)NAO........: ");
   printf("%c\n", carro.vei_flag_carga);

   printf("VALOR DE COMPRA DO VEICULO....: ");
   printf("%.2f\n", carro.vei_valor_compra);

   printf("VALOR ATUAL DO VEICULO........: ");
   printf("%.2f", carro.vei_valor_atual);

   getch();
  };

  system("cls");

  media_portas = 0;
  if (cont_vei_mais_6eixos > 0) media_portas = float(cont_portas_vei_mais_6eixos) / cont_vei_mais_6eixos;

  perc_10anos  = 0;
  if (cont_vei) perc_10anos = (float(cont_vei_mais_10anos) / cont_vei) * 100;

  printf("MEDIA DE PORTAS DOS VEICULOS COM MAIS DE 6 EIXOS.: ");
  printf("%.2f\n", float(media_portas));

  printf("PERCENTUAL DOS VEICULOS COM MAIS DE 10 ANOS DE USO.: ");
  printf("%.2f\n", float(perc_10anos));

  printf("VALOR DA DEPRECIACAO DOS VEICULOS.: ");
  printf("%.2f\n", valor_deprec);

  getch();
}
