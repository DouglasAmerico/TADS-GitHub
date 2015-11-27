
  #include <stdio.h>
  #include <conio.h>
  #include <stdlib.h>
  #define vot 5

  main()

  {
    int cont=0,voto,maior;
    int vetor[vot];
    char nome[7];
    do
    {
        printf ("            Eleiçoes 2013           \n");
        printf ("Insira seu voto digitando o numero dos candidatos a baixo mostrados\n");
        printf ("----------- 1 - José  -------------------------------------------- \n");
        printf ("----------- 2 - Maria -------------------------------------------- \n");
        printf ("----------- 3 - João  -------------------------------------------- \n");
        printf ("----------- 4 - Em branco ---------------------------------------- \n");
        printf ("----------- 5 - Nulo  -------------------------------------------- \n");

        scanf  ("%d",&voto);
        system ("cls");

        if (voto==1) vetor[1] = vetor[1]++;
        else if (voto==2) vetor[2]= vetor[2]++;
             else if (voto==3) vetor[3]= vetor[3]++;
                  else if (voto==4) vetor[4]=vetor[4]++;
                       else if (voto==5) vetor[5] = vetor[5]++;
    }
    while (voto == 0);

    for (cont=1;cont<6;cont++)
      {
       if (vetor[cont]> maior) maior= cont;
      }
    if (maior==1)  nome[7]= "jose";
        else if (maior==2) nome[7]= "Maria";
             else if (maior==3) nome[7]= "João";
                  else if (maior==4) nome[7]= "Em branco";
                       else if (maior==5) nome[7]= "Nulo";

    printf ("O José fez %d votos \n",vetor[1]);
    printf ("A Maria fez %d votos \n",vetor[2]);
    printf ("O João fez %d votos \n",vetor[3]);
    printf ("Ouve %d votos em Branco \n",vetor[4]);
    printf ("Ouve %d votos nulos \n"),vetor[5];
    printf ("O vencedor é %s ",nome);
    getch  ();
  }
