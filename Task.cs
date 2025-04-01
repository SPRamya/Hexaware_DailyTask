using System;
using System.Collections.Generic;

class BankProgram
{
    static void Main()
    {
        Console.WriteLine("Program is starting...\n");

        // Task 1: Loan Eligibility
        Console.WriteLine("Task 1: Loan Eligibility");
        Console.Write("Enter your credit score: ");
        int creditScore = int.Parse(Console.ReadLine());
        Console.Write("Enter your annual income: ");
        double annualIncome = double.Parse(Console.ReadLine());

        if (creditScore > 700 && annualIncome >= 50000)
            Console.WriteLine("You are eligible for a loan.\n");
        else
            Console.WriteLine("You are not eligible for a loan.\n");

        // Task 2: ATM Transaction
        double balance = 1000;
        Console.WriteLine("Task 2: ATM Transaction");
        Console.WriteLine("1. Check Balance\n2. Withdraw\n3. Deposit");
        Console.Write("Enter your choice (1/2/3): ");
        int choice = int.Parse(Console.ReadLine());

        if (choice == 1)
        {
            Console.WriteLine($"Your balance is: ${balance}\n");
        }
        else if (choice == 2)
        {
            Console.Write("Enter amount to withdraw: ");
            double withdrawAmount = double.Parse(Console.ReadLine());
            if (withdrawAmount > balance)
                Console.WriteLine("Insufficient balance.\n");
            else if (withdrawAmount % 100 == 0 || withdrawAmount % 500 == 0)
            {
                balance -= withdrawAmount;
                Console.WriteLine($"Withdrawal successful. New balance: ${balance}\n");
            }
            else
                Console.WriteLine("Withdrawal amount must be in multiples of 100 or 500.\n");
        }
        else if (choice == 3)
        {
            Console.Write("Enter amount to deposit: ");
            double depositAmount = double.Parse(Console.ReadLine());
            balance += depositAmount;
            Console.WriteLine($"Deposit successful. New balance: ${balance}\n");
        }
        else
            Console.WriteLine("Invalid choice.\n");

        // Task 3: Compound Interest Calculation
        Console.WriteLine("Task 3: Compound Interest Calculation");
        Console.Write("Enter initial balance: ");
        double initialBalance = double.Parse(Console.ReadLine());
        Console.Write("Enter annual interest rate (%): ");
        double annualInterestRate = double.Parse(Console.ReadLine());
        Console.Write("Enter number of years: ");
        int years = int.Parse(Console.ReadLine());

        double futureBalance = initialBalance * Math.Pow(1 + annualInterestRate / 100, years);
        Console.WriteLine($"Future balance after {years} years: ${futureBalance}\n");

        // Task 4: Account Validation
        string validAccountNumber = "INDB2345";
        double accountBalance = 1000.00;
        string enteredAccountNumber;
        do
        {
            Console.Write("Task 4: Account Validation\nEnter your account number (INDB followed by 4 digits): ");
            enteredAccountNumber = Console.ReadLine();

            if (enteredAccountNumber == validAccountNumber)
            {
                Console.WriteLine($"Account balance: ${accountBalance}\n");
                break;
            }
            else
                Console.WriteLine("Invalid account number. Please try again.\n");
        } while (true);

        // Task 5: Password Validation
        Console.Write("Task 5: Password Validation\nCreate a password: ");
        string password = Console.ReadLine();
        if (password.Length >= 8 && password.Any(char.IsUpper) && password.Any(char.IsDigit))
            Console.WriteLine("Password is valid.\n");
        else
            Console.WriteLine("Password is invalid.\n");

        // Task 6: Transaction History
        List<string> transactions = new List<string>();
        string userChoice;
        do
        {
            Console.Write("Task 6: Transaction History\nEnter a transaction (Deposit or Withdrawal): ");
            string transaction = Console.ReadLine();
            Console.Write("Enter the amount: ");
            double amount = double.Parse(Console.ReadLine());

            if (transaction.Equals("Deposit", StringComparison.OrdinalIgnoreCase))
                transactions.Add($"Deposited: ${amount}");
            else if (transaction.Equals("Withdrawal", StringComparison.OrdinalIgnoreCase))
                transactions.Add($"Withdrew: ${amount}");
            else
                Console.WriteLine("Invalid transaction type.\n");

            Console.Write("Would you like to add another transaction? (yes/no): ");
            userChoice = Console.ReadLine();
        } while (userChoice.Equals("yes", StringComparison.OrdinalIgnoreCase));

        Console.WriteLine("\nTransaction History:");
        foreach (string transaction in transactions)
            Console.WriteLine(transaction);
    }
}