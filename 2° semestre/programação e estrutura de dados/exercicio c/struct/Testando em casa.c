#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

struct cadastro
{
    char nome1[40],nome2[40],endereco[40];
    int sal1,sal2;
    float m_mes,m_ano;
} cad;

main()
{
    FILE *arq_cad;
    arq_cad= fopen ("Cadastro do Casal.txt","r+b");
    if (arq_cad == NULL)
    {
        arq_cad= fopen ("Cadastro do Casal.txt","w+b");
    }

    printf ("informe o nome do Homem: ");
    gets   (cad.nome1);
    printf ("Informe o da mulher: ");
    scanf  ("%s",&cad.nome2);
    printf ("Informe o endereço do  casal: ");
    //gets   (cad.endereco);
    scanf  ("%s",&cad.endereco);
    printf ("Informe o salario do %s: ",cad.nome1);
    scanf  ("%d",&cad.sal1);
    printf ("Informe o salrio da %s\n\n: ",cad.nome2);
    scanf  ("%d",&cad.sal2);
    cad.m_mes= (cad.sal1 + cad.sal2)/2;
    cad.m_ano= ((cad.sal1 + cad.sal2)*12)/2;



    fwrite (&cad, sizeof(cad),1,arq_cad);

    fclose (arq_cad);
   getch();

    arq_cad = fopen ("Cadastro do Casal.txt","r+b");

    printf ("O salario de %s é: %d\n",cad.nome1,cad.sal1);
    printf ("O salario de %s é: %d\n",cad.nome2,cad.sal2);
    printf ("Abitantes do endereço: %s\n",cad.endereco);
    printf ("A media mensal do casal é: %.2f\n",cad.m_mes);
    printf ("A media anual do casal é: %.2f\n",cad.m_ano);

    getch();
}
