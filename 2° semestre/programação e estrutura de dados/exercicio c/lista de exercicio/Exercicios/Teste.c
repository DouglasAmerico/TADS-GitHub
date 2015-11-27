#include<stdio.h>
#include<conio.h>
#include<stdio.h>
#include<string.h>

struct cadastro
{
    char nome[20],sexo;
    int num;
    float salario;
} cad;
//--------------------------
   FILE *arquivo;
   void criar()
   {
       arquivo= fopen("7func.dat","r+b");
       if (arquivo == NULL) {arquivo= fopen("7Func.dat","w+b");}
   }
//--------------------------
  void abrir()
  {
      arquivo= fopen("7Func.dat","r+b");
  }
//--------------------------
  void fechar()
  {
      fclose(arquivo);
  }
//--------------------------
  void antes()
  {
      printf ("Salarios cadastrados: \n");
      printf ("#############################\n\n");
  }
//--------------------------
  void depois()
  {
      printf ("Salario depois do reajuste: \n");
      printf ("############################\n\n");
  }
//--------------------------
  void apresentar()
  {
      printf ("Nome: %s\n",cad.nome);
      printf ("Sexo: %c\n",cad.sexo);
      printf ("Salario: %.2f\n",cad.salario);
      printf ("N° de Dependentes: %d\n",cad.num);
      printf ("---------------------------\n");
  }
//--------------------------
main()
{
    int quant,cont;
    printf ("Informe quantos funcionarios serão cadastrados: ");
    scanf  ("%d",&quant);
    if (quant > 1000) {printf ("So poderão ser cadastrados ate 1000 funcionarios\n");scanf  ("%d",&quant);}
    system ("cls");
    criar();

    for (cont=0;cont<quant;++cont)
    {
      fflush(stdin);
      printf ("Informe o nome do funcionario: ");
      gets   (cad.nome);
      fflush(stdin);
      printf ("Informe o sexo de %s, (F/M): ",cad.nome);
      scanf  ("%c",&cad.sexo);
      fflush(stdin);
      printf ("Informe o salario de %s: ",cad.nome);
      scanf  ("%f",&cad.salario);
      fflush(stdin);
      printf ("Informe o numero de dependentes de %s: ",cad.nome);
      scanf  ("%d",&cad.num);
      printf ("---------------------------------------\n");

      fwrite (&cad,sizeof(cad),1,arquivo);
    }
    fechar();
    //fseek (arquivo,0, SEEK_SET);

    abrir();
    antes();
    //cont=0;
    while (fread(&cad,sizeof(cad),1,arquivo))
    {
      if (cad.salario != 0)
      { apresentar(); getch();}
    }

    system ("cls");
    fseek (arquivo,0, SEEK_SET);
    cont=0;

    //if ((cad.num > 5) && (toupper(cad.sexo) == 'F')) {depois();}
    while (fread(&cad,sizeof(cad),1,arquivo))
    {
        printf ("%c",(cad.sexo));
        getch();
      ++cont;
      if ((cad.num > 5) && ((cad.sexo) == 'F'))
      {
        //depois();
        fseek(arquivo,sizeof(cad) * (cont - 1),SEEK_SET);
        cad.salario= cad.salario + (cad.salario/100*5);
        fwrite(&cad,sizeof(cad),1,arquivo);
        fseek(arquivo,sizeof(cad) * cont,SEEK_SET);

        apresentar();
        system ("cls");
      }
    }
    fechar();

    int tot_homem=0,tot_mulher=0;
    float media_m_15000=0,homem_4_dep=0,mulher_3_dep=0,perce_h_500=0;
}

