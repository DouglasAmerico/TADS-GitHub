
  #include<stdio.h>
  #include<conio.h>
  #include<stdlib.h>

  int func(int num2)
  {
    int div=0,cont=0;
    for (cont= num2;cont>0;cont--)
    {
    if ((cont % 2)==0)  div = div++;
    };
  return div;
  }

  main()
  {
    printf ("Informe um numero inteiro e positivo\n");
    int num=0;
    scanf ("%d",&num);

    printf ("O numero %d tem %d divisores",num,func(num));
    getch();
  }
