#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define dim 4
#define sim 4

void func_vetor (float matriz[dim][sim],int tam,int tam2,float vetor[dim])
{
    int cont=0;
    for (cont=0;cont<tam;cont++)
    {
       vetor[cont]= matriz[cont][cont];
    }
}

void func_proc (float matriz[dim][sim],int tam,int tam2,int numero)
{
  int cont=0,cont2=0,igual=0;
    for (cont=0;cont<tam;cont++)
    {
        for (cont2=0;cont2<tam2;cont2++)
        {
           if (numero == matriz[cont][cont2]) igual= 1;
        }
    }
    matriz[0][0]= igual;
}

void  func_maior (float matriz[dim][sim],int tam,int tam2)
{
    int cont=0,cont2=0,maior=0;
    for (cont=0;cont<tam;cont++)
    {
        for (cont2=0;cont2<tam2;cont2++)
        {
           if (maior<matriz[cont][cont2]) maior= matriz[cont][cont2];
        }
    }
    matriz[0][0]= maior;
}

void func_media (float matriz[dim][sim],int tam2,int tam)
{
   int cont,cont2;
   float media=0;
   for (cont=0;cont<tam;cont++)
   {
       for (cont2=0;cont2<tam2;cont2++)
       {
           media= media + matriz[cont][cont2];
       }
   }
  media= media/tam;
   matriz[0][0]= media;

}

main()
{
    int cont=0,cont2=0;
    float matriz[dim][sim],vetor[dim],pos;
    for (cont=0;cont<dim;cont++)
    {
      system  ("cls");
      for (cont2=0;cont2<dim;cont2++)
      {
        printf ("Informe o valor da linha %d coluna %d\n",cont+1,cont2+1);
        scanf  ("%f",&matriz[cont][cont2]);

      }
    }

    system ("cls"); //limpar a tela apos o leitura doos valores;

    //calculo da media da matriz;
    pos= matriz[0][0]; //Variavel para conter o valor da posicao 0,0;
    func_media(matriz,sim,dim); //chamada da media;
    printf ("A media dos elementos da matriz é %.2f\n\n",matriz[0][0]);
    matriz[0][0]= pos; //reconstituição do valor da posição 0,0;

    printf (" \n");
    //calculo do maior elemennto da matriz;
    func_maior(matriz,sim,dim);
    printf ("O maior elemennto da matriz é %2.f\n\n",matriz[0][0]);
    matriz[0][0]= pos; //reconstituição do valor da posição 0,0;

    printf (" \n");
    //calculo da procura de um elemento;
    printf ("Informe o numero a ser proocurado na matriz\n");
    int num=0;
    scanf  ("%d",&num);
    func_proc (matriz,dim,sim,num);
    if (matriz[0][0] == 1) {printf ("O numero existe na matriz\n");} //numero voltou com um valorbooleano 1 sendo existente e 0 ñ existtente;
    else {printf ("O numero não existe na matriz\n");}
    matriz[0][0]= pos; //reconstituição do valor da posição 0,0;

    printf (" \n");
    //calculo da diagonal principal da matriz transferida para o vetor;
    func_vetor(matriz,dim,sim,vetor);
    for (cont=0;cont<dim;cont++)
    {
        printf ("A diagonal principal posição %d,%d é%2.f\n",cont+1,cont+1,vetor[cont]);
    }

    getch();
}
