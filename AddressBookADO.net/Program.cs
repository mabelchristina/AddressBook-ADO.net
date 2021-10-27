using System;

namespace AddressBookADO.net
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to addressBook");
            AddressRepo addressBookRepo = new AddressRepo();
            AddressModel addressModel = new AddressModel();
            while (true)
            {
                Console.WriteLine("1)GetAllData\n" + "2)Retrive person by city or state\n");

                try
                {
                    var choice = Convert.ToInt32(Console.ReadLine());
                    switch (choice)
                    {
                        case 1:
                            addressBookRepo.GetAllData();
                            break;

                        case 2:
                            Console.WriteLine("Enter your city");
                            addressModel.City = Console.ReadLine();
                            Console.WriteLine("Enter your state");
                            addressModel.State = Console.ReadLine();
                            addressBookRepo.RetrivePersonsCityOrState(addressModel);
                            break;
                        default:
                            Console.WriteLine("Please Enter correct option");
                            break;
                    }
                }
                catch (System.FormatException formatException)
                {
                    Console.WriteLine(formatException.Message);
                }
            }

        }
    }

}
