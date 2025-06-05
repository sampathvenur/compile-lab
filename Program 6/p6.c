#include <stdio.h>

int main() {
    FILE *in = fopen("input.txt", "r");
    FILE *out = fopen("output.txt", "w");

    char a[10], b[10], c[10], op;

    while (!feof(in)) {
        if (fscanf(in, "%s = %s %c %s", a, b, &op, c) == 4) {
            fprintf(out, "MOV R0, %s\n", b);
            if (op == '+') fprintf(out, "ADD R0, %s\n", c);
            if (op == '-') fprintf(out, "SUB R0, %s\n", c);
            if (op == '*') fprintf(out, "MUL R0, %s\n", c);
            if (op == '/') fprintf(out, "DIV R0, %s\n", c);
            fprintf(out, "MOV %s, R0\n", a);
        }
        else if (fscanf(in, "%s = -%s", a, b) == 2) {
            fprintf(out, "MOV R0, -%s\nMOV %s, R0\n", b, a);
        }
        else if (fscanf(in, "%s = %s", a, b) == 2) {
            fprintf(out, "MOV R0, %s\nMOV %s, R0\n", b, a);
        }
        // Move to next line
        fscanf(in, "%*[^\n]\n");
    }

    fclose(in);
    fclose(out);
    return 0;
}

// Design, develop and implement a C/Java program to generate the machine code using
// Triples for the statement A = -B * (C +D) whose intermediate code in three-address
// form:
// T1 = -B
// T2 = C + D
// T3 = T1 * T2
// A = T3