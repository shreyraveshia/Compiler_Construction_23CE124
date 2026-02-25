%{
#include <stdio.h>

int len = 0;
int lower = 0;
int upper = 0;
int digit = 0;
int symbol = 0;
%}

%%
[a-z]      { lower++; len++; }
[A-Z]      { upper++; len++; }
[0-9]      { digit++; len++; }
[\*\;\#\$\@] { symbol++; len++; }
\n         { return 0; }     /* End of input */
.          { len++; }        /* Any other char */
%%

int main()
{
    printf("Enter password:\n");
    yylex();

    if(len >= 9 && len <= 15 &&
       lower > 0 &&
       upper > 0 &&
       digit > 0 &&
       symbol > 0)
        printf("Valid password\n");
    else
        printf("Invalid password\n");

    return 0;
}

int yywrap()
{
    return 1;
}