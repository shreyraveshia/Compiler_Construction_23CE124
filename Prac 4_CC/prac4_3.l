%{
#include <stdio.h>

int chars = 0;
int words = 0;
int lines = 0;
%}

%%
\n              { chars++; lines++; }
[ \t]+          { chars += yyleng; }
[^ \t\n]+       { chars += yyleng; words++; }
%%

int main(int argc, char *argv[])
{
    if(argc > 1)
    {
        FILE *fp = fopen(argv[1], "r");
        if(!fp)
        {
            printf("Cannot open file\n");
            return 1;
        }
        yyin = fp;        /* Read from file */
    }

    yylex();

    printf("Characters : %d\n", chars);
    printf("Words : %d\n", words);
    printf("Line : %d\n", lines);

    return 0;
}

int yywrap()
{
    return 1;
}