using System;
using System.Collections.Generic;

namespace Bank_HM
{
    /* class Program
     {
         static void Main(string[] args)
         {
             // Initialize services
               var customerService = new CustomerServiceProviderImpl();
                var bankService = new BankServiceProviderImpl("Main Branch", "123 Banking St");

                // Initialize bank with services
                var bank = new Bank();

                Console.WriteLine("Welcome to HM Bank!");

                while (true)
                {
                    DisplayMainMenu();
                    var choice = Console.ReadLine();

                    try
                    {
                        switch (choice)
                        {
                            case "1":
                                CreateNewAccount(bank, bankService);
                                break;
                            case "2":
                                PerformDeposit(customerService);
                                break;
                            case "3":
                                PerformWithdrawal(customerService);
                                break;
                            case "4":
                                CheckBalance(customerService);
                                break;
                            case "5":
                                TransferFunds(customerService);
                                break;
                            case "6":
                                ViewAccountDetails(customerService);
                                break;
                            case "7":
                                Console.WriteLine("Thank you for banking with us!");
                                return;
                            default:
                                Console.WriteLine("Invalid option, please try again.");
                                break;
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error: {ex.Message}");
                    }
                }
            }

            static void DisplayMainMenu()
            {
                Console.WriteLine("\nMain Menu:");
                Console.WriteLine("1. Create New Account");
                Console.WriteLine("2. Deposit Money");
                Console.WriteLine("3. Withdraw Money");
                Console.WriteLine("4. Check Balance");
                Console.WriteLine("5. Transfer Funds");
                Console.WriteLine("6. View Account Details");
                Console.WriteLine("7. Exit");
                Console.Write("Please select an option (1-7): ");
            }

            // Implementation of menu operations would go here
            static void CreateNewAccount(Bank bank, BankServiceProviderImpl bankService)
            {
                Console.WriteLine("\nCreate New Account");
                Console.Write("Enter customer first name: ");
                var firstName = Console.ReadLine();

                Console.Write("Enter customer last name: ");
                var lastName = Console.ReadLine();

                Console.Write("Enter account type (Savings/Current): ");
                var accountType = Console.ReadLine();

                Console.Write("Enter initial deposit: ");
                var balance = double.Parse(Console.ReadLine());

                var customer = new Customer(
                    customerID: new Random().Next(1000, 9999),
                    firstName: firstName,
                    lastName: lastName,
                    emailAddress: "",
                    phoneNumber: "",
                    address: ""
                );

                bank.CreateAccount(customer, accountType, balance);
                Console.WriteLine("Account created successfully!");
            }

            // Other operation methods would follow similar patterns
            static void PerformDeposit(CustomerServiceProviderImpl service)
            {
                Console.Write("Enter account number: ");
                var accNumber = long.Parse(Console.ReadLine());

                Console.Write("Enter deposit amount: ");
                var amount = double.Parse(Console.ReadLine());

                service.Deposit(accNumber, amount);
            }

            // Additional methods for other operations...
        }
    }*/
    public class Program
    {
        static void Main(string[] args)
        {

            AccountDaoList accountDao = new AccountDaoList();
            //AccountDaoSet accountDao = new AccountDaoSet();
            //AccountDaoHashMap accountDao = new AccountDaoHashMap();

            Bank bank = new Bank(accountDao);

            UserInterface ui = new UserInterface(bank);
            ui.ShowMenu();
        }
    }
}
