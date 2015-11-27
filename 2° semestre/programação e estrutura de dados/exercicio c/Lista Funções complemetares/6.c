

 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>
 #define v1 5
 #define v2 8

 void func(int vet1[v1],int vet2[v2],int vet3[v2],int v11,int v22)
 {
     int cont=0,cont2=0;
     for (cont=0;cont< v11;cont++)
     {
         for (cont2=0;cont2 < v22;cont2++)
         {
           if (vet1[cont] == vet2[cont2]) {vet3[cont]= vet1[cont];}
           //else {vet3[cont]= 0;};
         }
     }
 }

 main()
 {
     int vet1[v1],vet2[v2],vet3[v2],cont=0,cont2=0;
     for (cont=0;cont<v1;cont++)
     {
         printf ("Informe o elemento %d do vetor 1\n",cont+1);
         scanf ("%d",&vet1[cont]);

         for (cont2=0;cont2 < v1;cont2++)
         {
             if (cont != cont2) {if (vet1[cont] == vet1[cont2]) {printf ("Numero ja atribuido substitua-o\n"); scanf ("%d",&vet1[cont]);} }
          }

     };
    system ("cls");
    for (cont=0;cont< v2;cont++)
    {
        printf ("Informe o elemento %d do vetor 2\n",cont+1);
        scanf  ("%d",&vet2[cont]);


        for(cont2=0;cont2< v2;cont2++)
        {
            if (cont != cont2) {if (vet2[cont] == vet2[cont2]) {printf ("Numero ja atrbuido substitua-o\n"); scanf("%d",vet2[cont]);} }
        }
    };
    system ("cls");

    func(vet1,vet2,vet3,v1,v2);

    printf ("O valoresif conjunto intersecção são:\n");
    for (cont=0;cont<v2;cont++)
    {
       if (vet3[cont] < 10000 && vet3[cont] != 0) {printf ("%d,",vet3[cont]);}
    }
    getch();
 }
