#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "cmdargs.h"

typedef struct {
    char* sources;
} _clOpts;

_clOpts clOpts = {
    .sources = "-s",
};

uint8_t checkArg(char* arg);

clArgs* parseArgs(int argc, char** argv){
    clArgs* args = (clArgs*)calloc(1, sizeof(clArgs));
    
    for(int i = 0; i < argc; i++){
        if (strcmp(argv[i], clOpts.sources)){

        }else{

        }
    }

    return args;
}


uint8_t checkArg(char* arg){
    return 0;
}
