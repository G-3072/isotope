#ifndef UTIL_H
#define UTIL_H

#include <stdint.h>
#include <stdbool.h>

#define UCASE(c) (~(1<<5)&(c))
#define LCASE(c) ((1<<5)|(c))

typedef struct {
    uint64_t nBytes;
    char* contents;
} fileBuffer;


fileBuffer* readFile(char* filename);

#endif
