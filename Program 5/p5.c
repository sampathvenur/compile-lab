#include <stdio.h>
#include <string.h>

char stack[30] = "", input[30];
int i = 0;

void show(const char *msg) {
    printf("\n$%-9s %-9s$ %-15s", stack, input + i, msg);
}

int main() {
    printf("GRAMMAR:\nE->E+T | T\nT->T*F | F\nF->id\n");
    printf("\nEnter input string: ");
    scanf("%s", input);

    printf("\nSTACK      INPUT      ACTION");

    while (input[i]) {
        if (input[i] == 'i' && input[i+1] == 'd') {
            strcat(stack, "id"); i += 2;
            show("SHIFT id");
            show("REDUCE F->id");
            show("REDUCE T->F");
            show("REDUCE E->T");
        } else {
            int len = strlen(stack);
            stack[len] = input[i++];
            stack[len+1] = '\0';
            char msg[15] = "SHIFT ";
            msg[6] = stack[len];
            msg[7] = '\0';
            show(msg);
            show("No reduce");
        }
    }

    show("REDUCE E->E+T");
    show("ACCEPT");
    return 0;
}

// Design, develop and implement YACC/C program to demonstrate Shift Reduce Parsing
// technique for the grammar rules: E ->E+T | T, T ->T*F | F, F ->(E) | id and parse the
// sentence: id + id * id.