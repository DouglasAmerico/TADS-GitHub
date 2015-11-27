 //push e pop igual

 int valida_expressao(tipo_pilha *p,char p_expressao[50])
 {
     int w_flag_sem_erro = 1;
     int cont = 0;
     while ((w_flag_sem_erro) &(cont < strlen(p_expressao)))
     {
         if (p_expressao[cont] == '(') push(p, '(');
         else if (p_expressao[cont] == ')')
         {
             if (!pilha_vazia(p)) pop(p);
             else w_flag_sem_erro= 0;
         }
         ++cont;
     }
     if (!pilha_vazia(p)) w_flag_sem_erro= 0;
     return (w_flag_sem_erro);
 }
