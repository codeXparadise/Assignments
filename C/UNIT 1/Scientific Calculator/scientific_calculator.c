#include <stdio.h>
#include <math.h>

int main(void) {
    int choice;
    double a, b, result;
    int intA, intB;

    do {
        printf("\n===== Scientific Calculator =====\n");
        printf("1. Addition\n");
        printf("2. Subtraction\n");
        printf("3. Multiplication\n");
        printf("4. Division\n");
        printf("5. Modulus\n");
        printf("6. Power\n");
        printf("7. Percentage\n");
        printf("8. Exit\n");
        printf("Enter your choice: ");

        if (scanf("%d", &choice) != 1) {
            printf("Invalid input. Please enter a number from 1 to 8.\n");
            while (getchar() != '\n') {
                /* Clear invalid input from the keyboard buffer. */
            }
            continue;
        }

        switch (choice) {
            case 1:
                printf("Enter two numbers: ");
                scanf("%lf %lf", &a, &b);
                printf("Result = %.2f\n", a + b);
                break;

            case 2:
                printf("Enter two numbers: ");
                scanf("%lf %lf", &a, &b);
                printf("Result = %.2f\n", a - b);
                break;

            case 3:
                printf("Enter two numbers: ");
                scanf("%lf %lf", &a, &b);
                printf("Result = %.2f\n", a * b);
                break;

            case 4:
                printf("Enter dividend and divisor: ");
                scanf("%lf %lf", &a, &b);
                if (b == 0) {
                    printf("Error: Division by zero is not allowed.\n");
                } else {
                    printf("Result = %.2f\n", a / b);
                }
                break;

            case 5:
                printf("Enter two integers: ");
                if (scanf("%d %d", &intA, &intB) != 2) {
                    printf("Invalid input. Modulus requires two integers.\n");
                    while (getchar() != '\n') {
                        /* Clear invalid input from the keyboard buffer. */
                    }
                } else if (intB == 0) {
                    printf("Error: Modulus by zero is not allowed.\n");
                } else {
                    printf("Result = %d\n", intA % intB);
                }
                break;

            case 6:
                printf("Enter base and exponent: ");
                scanf("%lf %lf", &a, &b);
                result = pow(a, b);
                printf("Result = %.2f\n", result);
                break;

            case 7:
                printf("Enter value and percentage: ");
                scanf("%lf %lf", &a, &b);
                result = (a * b) / 100.0;
                printf("%.2f%% of %.2f = %.2f\n", b, a, result);
                break;

            case 8:
                printf("Exiting calculator. Goodbye!\n");
                break;

            default:
                printf("Invalid menu choice. Please choose a number from 1 to 8.\n");
        }
    } while (choice != 8);

    return 0;
}
