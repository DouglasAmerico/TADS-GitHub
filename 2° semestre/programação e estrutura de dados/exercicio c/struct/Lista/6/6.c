#include<stdlib.h>
#include<conio.h>
#include<stdio.h>
#include<string.h>

struct veiculos
{
  char placa[7],descricao[20],cor[20],carga;
  int eixo,num_portas,ano,valor_compra,valor_medio;
} veiculo;
//-----------------------
  FILE *arquivo;
  //veiculo veiculos;
  void criar()
{
  arquivo= fopen ("6Veiculos.txt","r+b");
    if (arquivo == NULL)
    {
        arquivo= fopen ("6Veiculos.txt","w+b");
    }
}
//-----------------------
  void abrir()
  {
      arquivo= fopen ("6Veiculos.txt","r+b");
  }
//-----------------------
  void fechar()
  {
      fclose (arquivo);
  }
//-----------------------
main()
{
  int quant,cont;
  printf ("Informe quantos veiculos vão ser cadasrados: ");
  scanf  ("%d",&quant);
  system ("cls");

  criar();

  for (cont=0;cont<quant;++cont)
  {
  fflush(stdin);
  printf ("Informe a placa do veiculo: ");
  gets   (veiculo.placa);
  fflush(stdin);
  printf ("Informe a descrição do veiculo: ");
  gets   (veiculo.descricao);
  fflush(stdin);
  printf ("Informe o ano: ");
  scanf  ("%d",&veiculo.ano);
  fflush(stdin);
  printf ("Informe o numero de eixos: ");
  scanf  ("%d",&veiculo.eixo);
  fflush(stdin);
  printf ("Informe a cor: ");
  gets   (veiculo.cor);
  fflush(stdin);
  printf ("Informe o numeros de portas: ");
  scanf  ("%d",&veiculo.num_portas);
  fflush(stdin);
  printf ("Veiculo de carga? (S/N): ");
  scanf  ("%c",&veiculo.carga);
  fflush(stdin);
  printf ("Informe o valor da compra: ");
  scanf  ("%d",&veiculo.valor_compra);
  fflush(stdin);
  printf ("Informe o valor medio atual: ");
  scanf  ("%d",&veiculo.valor_medio);
  printf ("------------------------------\n\n");

  fwrite (&veiculo,sizeof(veiculo),1,arquivo);
  }
  fechar();
  getch();
  system ("cls");

  float media_portas=0,percentual=0;
  int depre=0,manipulacao=0,v_mais_6=0;

  abrir();
  while (fread(&veiculo,sizeof(veiculo),1,arquivo))
  {
      ++manipulacao;

      if (veiculo.eixo >= 6) {media_portas = media_portas + veiculo.num_portas; ++v_mais_6;}

      if ((2013 - veiculo.ano)> 10) {++percentual;}

      //depre= depre + (veiculo.valor_compra - veiculo.valor_medio);

      if (toupper(veiculo.carga) == 'S')
      {
          fseek(arquivo,sizeof(veiculo) * (manipulacao - 1),SEEK_SET);
          veiculo.carga= 'N';
          fwrite(&veiculo,sizeof(veiculo), 1,arquivo);
          fseek(arquivo,sizeof(veiculo) * manipulacao,SEEK_SET);
      }
         /*fseek(arq_func, sizeof(funcionario) * (cont_func - 1), SEEK_SET);
         func.salario *= 1.15;
         fwrite(&func, sizeof(funcionario), 1, arq_func);
         fseek(arq_func, sizeof(funcionario) * cont_func, SEEK_SET);
  */
  }

    fseek(arquivo,0,SEEK_SET);
    //fseek(arq_func, 0, SEEK_SET);

    media_portas= media_portas/v_mais_6;
    percentual= percentual*100/quant;
   printf ("O valor da depreciação dos veiculos:\n");
   printf ("------------------------------------\n");
   while (fread(&veiculo,sizeof(veiculo),1,arquivo))
   {
     printf ("O veiculo: %s\n",veiculo.descricao);
     printf ("Placa: %s\n",veiculo.placa);
     printf ("Com %d de depreciação\n",veiculo.valor_compra - veiculo.valor_medio);
     printf ("--------------------------\n");
     getch  ();
   }
  fechar();
  system ("cls");

  printf ("---------------------------\n");
  printf ("A média de portas dos veiculos com mais de 6 Eixos é: %.2f\n",media_portas);
  printf ("O percentual de veiculos com mais de 10 nos em relação ao total é %.2f%%\n",percentual);
  getch();

}
