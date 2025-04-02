// Account.cs
using System;

namespace BankingSystem
{
    public class Account
    {
        // Private Attributes
        protected int accountNumber;
        protected string accountType;
        protected double accountBalance;
        protected const double interestRate = 4.5; // Fixed Interest Rate

        // Default Constructor
        public Account() { }

        // Parameterized Constructor
        public Account(int accNum, string accType, double accBalance)
        {
            this.accountNumber = accNum;
            this.accountType = accType;
            this.accountBalance = accBalance;
        }

        // Getter and Setter Methods
        public int AccountNumber { get => accountNumber; set => accountNumber = value; }
        public string AccountType { get => accountType; set => accountType = value; }
        public double AccountBalance { get => accountBalance; set => accountBalance = value; }

        // Overloaded Deposit Methods
        public void Deposit(float amount) => Deposit((double)amount);
        public void Deposit(int amount) => Deposit((double)amount);
        public void Deposit(double amount)
        {
            accountBalance += amount;
            Console.WriteLine($"Deposited {amount:C}. New Balance: {accountBalance:C}");
        }

        // Overloaded Withdraw Methods
        public void Withdraw(float amount) => Withdraw((double)amount);
        public void Withdraw(int amount) => Withdraw((double)amount);
        public virtual void Withdraw(double amount)
        {
            if (amount > accountBalance)
            {
                Console.WriteLine("Insufficient balance.");
            }
            else
            {
                accountBalance -= amount;
                Console.WriteLine($"Withdrawn {amount:C}. New Balance: {accountBalance:C}");
            }
        }

        // Virtual Method for Interest Calculation
        public virtual void CalculateInterest()
        {
            Console.WriteLine("Interest calculation is only applicable for savings accounts.");
        }

        // Method to Print Account Details
        public void PrintAccountInfo()
        {
            Console.WriteLine($"Account Number: {accountNumber}");
            Console.WriteLine($"Account Type: {accountType}");
            Console.WriteLine($"Balance: {accountBalance:C}");
            Console.WriteLine("----------------------------------");
        }
    }
}
