#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

struct academico
{
    char nome[20],sexo;
    int ra,periodo,quantidade_cursada;
    float valor;
} aluno;

main()
{/*
    char excluir;
    printf ("Deseja excluir o aqruivo ja existente? (S?N)");
    scanf  ("%c",&excluir);
    if (toupper(excluir)== 'S') {remove(*arquivo);}
   */ //Desejava excluir o arquivopara começar um novo do zero mais n deu muito certo.......

    FILE *arquivo;

    arquivo= fopen ("Acamicos.txt","r+b");
    if (arquivo == NULL) {arquivo= fopen ("Acamicos.txt","w+b");}

    int cont=0,registro,mais=0,menos=0;
    do
    {
      fflush(stdin);
      printf ("Informe o RA do academico: ");
      scanf ("%d",&registro);
      if (registro == 0) {break;}
      fflush(stdin);
      aluno.ra= registro;
      printf ("Informe o nome do academico: ");
      gets   (aluno.nome);
      fflush(stdin);
      printf ("Informe o sexo: ");
      scanf  ("%c",&aluno.sexo);
      fflush(stdin);
      printf ("Informe o periodo: ");
      scanf  ("%d",&aluno.periodo);
      fflush(stdin);
      printf ("Informe a quantidade de disciplinas cursadas: ");

      scanf  ("%d",&aluno.quantidade_cursada);
      if ((aluno.quantidade_cursada > 4) && (toupper(aluno.sexo)== 'M')) {++mais;}
      else if ((aluno.quantidade_cursada < 4) && (toupper(aluno.sexo)== 'F')) {++menos;}
      fflush(stdin);
      printf ("Informe o valor da mensalidade: ");
      scanf  ("%f",&aluno.valor);
      printf ("----------------------------\n\n");
      ++cont;

      fwrite (&aluno,sizeof(aluno),1,arquivo);
    }
    while (registro != 0);
    fclose (arquivo);
    float media=0,perc=0,v_total_antes=0,v_total_depois=0;
    int contador;

    arquivo= fopen ("Acamicos.txt","r+b");
    while (fread(&aluno,sizeof(aluno),1,arquivo))
    {
        ++contador;
        if ((aluno.valor < 500) && (toupper(aluno.sexo)== 'M')) {media= media + aluno.valor;}

        if (menos > mais) {printf ("Ocorre mais os academicos que fazem menos que 4 disciplinas\n");}
        else if (mais > menos) {printf ("Ocorre mais os academicos que fazem mais que 4 desciplinas\n");}

        if ((aluno.valor > 550) && (toupper(aluno.sexo)== 'F')) {++perc;}

        v_total_antes= v_total_antes + aluno.valor;

        if ((aluno.quantidade_cursada > 5) && (toupper(aluno.sexo)== 'F'))
        {
        fseek (arquivo,sizeof(aluno) * (contador - 1),SEEK_SET);
        aluno.valor= aluno.valor - (aluno.valor/100*10);
        fwrite (&aluno,sizeof(aluno),1,arquivo);
        fseek (arquivo,sizeof(aluno) * contador, SEEK_SET);
        }

        v_total_depois= v_total_depois + aluno.valor;
    }
    fclose(arquivo);

    //printf ("%f",media);
    //printf ("%f",perc);
    if (media == 0) {printf ("A media dos academicos que pagam menos que 500 é: 0\n");}
    else printf ("A media dos academicos que pagam menos de 500 é: %.2f\n",media/cont);

    if (perc == 0) {printf ("O percentual de academicos que pagam mais de 550 é: 0%%\n");}
    else printf ("O percentual de academicas que pagam mais de 550 é %.2f%%\n",perc*100/cont);

    printf ("O valor total antes do reajuste é de %.2f\n",v_total_antes);
    printf ("O valor total depois do reajuste é de %.2f\n",v_total_depois);

    getch();
}
