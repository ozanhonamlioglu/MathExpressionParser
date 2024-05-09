cmake_minimum_required(VERSION 3.26)
project(MathExpressionParser)

set(CMAKE_CXX_STANDARD 17)

# Find required packages
find_package(FLEX REQUIRED)

# Generate C source from Lex file
FLEX_TARGET(TheParser Parser.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c)

# Include binary directory to find lex.yy.c
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(include)

# Target executable
add_executable(Parser ${FLEX_TheParser_OUTPUTS} MexprEnums.h)

# Link libraries if needed (e.g., -lfl)
target_link_libraries(Parser ll)