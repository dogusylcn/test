#include <stdio.h>

static void init(int argc, char **argv, char **envp) {
    printf("Malwation Was Here\n");
}

static void fini(void) {
    printf("Hacked By Malwation\n");
}


__attribute__((section(".init_array"), used)) static typeof(init) *init_p = init;
__attribute__((section(".fini_array"), used)) static typeof(fini) *fini_p = fini;
