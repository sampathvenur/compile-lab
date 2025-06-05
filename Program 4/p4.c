#include <stdio.h>
#include <string.h>

char stack[20];
int top = -1, i = 0;
char input[20];

void push(char c) { stack[++top] = c; }
void pop() { if (top >= 0) top--; }
void show() {
    for (int j = top; j >= 0; j--) printf("%c", stack[j]);
}

int main() {
    printf("Grammar:\nA->aBa\nB->bB|@\nInput string: ");
    scanf("%s", input);

    push('$'); push('A');
    printf("\nStack\tInput\tAction\n-------------------\n");

    while (top >= 0) {
        show(); printf("\t%s\t", input + i);

        if (stack[top] == input[i]) {
            printf("Match %c\n", input[i]);
            pop(); i++;
            if (input[i] == '\0' && stack[top] == '$') break;
        } else if (stack[top] == 'A') {
            pop();
            printf("Apply A->aBa\n");
            push('a'); push('B'); push('a');
        } else if (stack[top] == 'B') {
            pop();
            if (input[i] == 'b') {
                printf("Apply B->bB\n");
                push('B'); push('b');
            } else {
                printf("Apply B->@\n");
            }
        } else {
            printf("Error\n"); return 0;
        }
    }

    printf(stack[top] == '$' && input[i] == '$' ? "Input rejected\n" : "Input accepted\n");
    return 0;
}

// Design, develop and implement YACC/C program to construct Predictive / LL(1)
// Parsing Table for the grammar rules: A ->aBa , B-> bB | . Use this table to parse the
// sentence: abba$.