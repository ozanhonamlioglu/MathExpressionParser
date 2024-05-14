#ifndef __PARSER_EXPORT__
#define __PARSER_EXPORT__

#include <stdint.h>

typedef struct lex_data_ {
    int token_code;
    int token_len;
    uint8_t *token_val;
} lex_data_t;

#define MAX_STRING_SIZE 512
#define MAX_MEXPR_LEN 512

/* Common Codes */
#define PARSER_EOL  10000
#define PARSER_QUIT 10001
#define PARSER_WHITE_SPACE  10002

#endif