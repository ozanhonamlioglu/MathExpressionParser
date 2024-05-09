//
// Created by ozanhonamlioglu on 9.05.2024.
//

#ifndef MATHEXPRESSIONPARSER_MEXPRENUMS_H
#define MATHEXPRESSIONPARSER_MEXPRENUMS_H

typedef enum {
    MATH_CPP_INT,
    MATH_CPP_DOUBLE,
    MATH_CPP_VARIABLE, // alphanumeric word
    MATH_CPP_IPV4, // 10.1.1.1

    MATH_CPP_DTYPE_MAX
} mexprecpp_dtypes_t;

typedef enum {
    PARSER_EOL = (int)MATH_CPP_DTYPE_MAX + 1
} EXTRA_ENUMS;

#endif //MATHEXPRESSIONPARSER_MEXPRENUMS_H
