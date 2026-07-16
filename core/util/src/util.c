#include <stdlib.h>
#include <stdio.h>

#include "util.h"

fileBuffer* readFile(char* filename){
    fileBuffer* fb = calloc(1, sizeof(fileBuffer));

    FILE* file = fopen(filename, "r");

    fseek(file, 0L, SEEK_END);
    fb->nBytes = ftell(file);
    fseek(file, 0L, SEEK_SET);

    fb->contents = (char*)calloc(fb->nBytes, sizeof(char));
    fread(fb->contents, sizeof(char), fb->nBytes, file);
    fclose(file);

    return fb;
}
