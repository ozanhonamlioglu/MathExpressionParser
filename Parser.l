%{
#include <assert.h>

#include "ParserExport.h"

typedef struct parser_stack_ {
    int top;
    lex_data_t data[MAX_MEXPR_LEN];
} parser_stack_t;

extern "C" int yylex();
extern unsigned char lex_buffer[MAX_STRING_SIZE];
extern parser_stack_t undo_stack;

unsigned char lex_buffer[MAX_STRING_SIZE] = {0};
unsigned char *curr_ptr = lex_buffer;


parser_stack_t undo_stack = {-1, {0,0,0}};


static void
lex_push(lex_data_t lex_data) {
    assert(undo_stack.top < MAX_MEXPR_LEN - 1);
    undo_stack.data[++undo_stack.top] = lex_data;
}

static lex_data_t
lex_pop() {
    assert(undo_stack.top > -1);
    lex_data_t res = undo_stack.data[undo_stack.top];
    undo_stack.top--;
    return res;
}



// user specific header files
#include "MexprEnums.h"

%}

%%

"(" {
    return MATH_BRACKET_START;
}

")" {
    return MATH_BRACKET_END;
}

"<=" {
    return MATH_LESS_THAN_EQ;
}

"<" {
    return MATH_LESS_THAN;
}

">" {
    return MATH_GREATER_THAN;
}

"=" {
    return MATH_EQ;
}

"!=" {
    return MATH_NOT_EQ;
}

"and" {
    return MATH_AND;
}

"or" {
    return MATH_OR;
}

"*" {
    return MATH_MUL;
}

"+" {
    return MATH_PLUS;
}

"-" {
    return  MATH_MINUS;
}

"/" {
    return MATH_DIV;
}

"," {
    return MATH_COMMA;
}

"sqrt" {
    return MATH_SQRT;
}

"sqr" {
    return MATH_SQR;
}

"mmax" {
    return MATH_MAX;
}

"mmin" {
    return MATH_MIN;
}

"sin" {
    return MATH_SIN;
}

"cos" {
    return MATH_COS;
}

"pow" {
    return MATH_POW;
}

\n {
    return PARSER_EOL;
}

"\\\n" {

}

[ ] {
    /* Ignore

     process_white_space(1);
     */
}

[\t] {
    /*ignore
    process_white_space(4);
    */
}

"\\q" {
    return PARSER_QUIT;
}

0|-?[1-9][0-9]* {
    return MATH_INTEGER_VALUE;
}

-?[0-9]*\.[0-9]+ {
    return MATH_DOUBLE_VALUE;
}

[a-zA-Z0-9_]+ {
    return MATH_IDENTIFIER;
}

[a-zA-Z0-9_]+\.[a-zA-Z0-9_]+ {
    return MATH_IDENTIFIER_IDENTIFIER;
}

'[^']*' {
    // string enclosed within single quotes
    return MATH_STRING_VALUE;
}

\"[^"]*\" {
    // string enclosed within double quotes
    return MATH_STRING_VALUE;
}


. {
    // ignore any other character
}

%%

int main(int argc, char** argv) {

    /*
    while(1) {

        printf("-----------\nInput -> ");
        fgets(lex_buffer, sizeof(lex_buffer), stdin);

        if(lex_buffer[0] == '\n') {
            lex_buffer[0] = 0;
            continue;
        }

        yy_scan_string(lex_buffer);

        int token_code;
        token_code = yylex();

        while(token_code != PARSER_EOL) {
            printf("token_code = %d, token = %s, token_len = %d\n", token_code, yytext, yyleng);
            token_code = yylex();
        }
    }

    */

}
