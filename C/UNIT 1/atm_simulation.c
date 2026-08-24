#include <stdio.h>

int main(void)
{
    int choice;
    double balance = 10000.00;
    double amount;

    do
    {
        printf("\n===== ATM Transaction Simulation =====\n");
        printf("1. Balance Enquiry\n");
        printf("2. Deposit\n");
        printf("3. Withdrawal\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");

        if (scanf("%d", &choice) != 1)
        {
            printf("Invalid input. Please enter a number from 1 to 4.\n");
            while (getchar() != '\n')
            {
                /* Clear invalid input from the keyboard buffer. */
            }
            continue;
        }

        switch (choice)
        {
        case 1:
            printf("Available balance = Rs. %.2f\n", balance);
            break;

        case 2:
            printf("Enter deposit amount: Rs. ");
            if (scanf("%lf", &amount) != 1)
            {
                printf("Invalid amount. Please enter a numeric value.\n");
                while (getchar() != '\n')
                {
                    /* Clear invalid input from the keyboard buffer. */
                }
            }
            else if (amount <= 0)
            {
                printf("Invalid amount. Deposit must be greater than zero.\n");
            }
            else
            {
                balance += amount;
                printf("Deposit successful.\n");
                printf("Updated balance = Rs. %.2f\n", balance);
            }
            break;

        case 3:
            printf("Enter withdrawal amount: Rs. ");
            if (scanf("%lf", &amount) != 1)
            {
                printf("Invalid amount. Please enter a numeric value.\n");
                while (getchar() != '\n')
                {
                    /* Clear invalid input from the keyboard buffer. */
                }
            }
            else if (amount <= 0)
            {
                printf("Invalid amount. Withdrawal must be greater than zero.\n");
            }
            else if (amount > balance)
            {
                printf("Transaction declined: Insufficient balance.\n");
                printf("Available balance = Rs. %.2f\n", balance);
            }
            else
            {
                balance -= amount;
                printf("Please collect your cash.\n");
                printf("Updated balance = Rs. %.2f\n", balance);
            }
            break;

        case 4:
            printf("Thank you for using the ATM. Goodbye!\n");
            break;

        default:
            printf("Invalid transaction choice. Please choose a number from 1 to 4.\n");
        }
    } while (choice != 4);

    return 0;
}
