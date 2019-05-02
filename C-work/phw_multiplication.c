#include <stdio.h>
int main()
{
    int c = 0;
    for(int a=2;a<10;a++)
    {
        for(int b=1;b<10;b++)
        {
            c=a*b;
            printf("%d * %d = %d\n",a,b,c);
        }
      printf("\n");
    }
    return 0;
}
