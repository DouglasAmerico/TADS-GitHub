

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
        printf ("            Eleiçoes 2013           ");
        printf ("Insira seu voto digitando o numero dos candidatos a baixo mostrados");
        printf ("----------- 1 - José  --------------------------------------------");
        printf ("----------- 2 - Maria --------------------------------------------");
        printf ("----------- 3 - João  --------------------------------------------");
        printf ("----------- 4 - Em branco ----------------------------------------");
        printf ("----------- 5 - Nulo  --------------------------------------------");

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
      };


    printf ("O José fez %d votos ",vetor[1]);
    printf ("A Maria fez %d votos",vetor[2]);
    printf ("O João fez %d votos ",vetor[3]);
    printf ("Ouve %d votos em Branco",vetor[4]);
    printf ("Ouve %d votos nulos"),vetor[5];
    printf ("");
    printf ("O vencedor é %c ",nome);
  }