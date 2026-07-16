#ifndef CMDARGS_H
#define CMDARGS_H


typedef struct {
   char** sourcefiles; 
   char** opts;
} clArgs;

clArgs* parseArgs(int argc, char** argv);

#endif
