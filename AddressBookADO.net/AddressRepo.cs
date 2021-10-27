using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace AddressBookADO.net
{
    public class AddressRepo
    {
        public static string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Address_Book_Service;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        SqlConnection connection = new SqlConnection(connectionString);
        public bool DataBaseConnection()
        {
            try
            {
                DateTime now = DateTime.Now; 
                connection.Open(); 
                using (connection)  
                {
                    Console.WriteLine($"Connection is created Successful {now}"); 
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return true;
        }
        public void GetAllData()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                AddressModel addressModel = new AddressModel();
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spGetAllAddressBook", this.connection);
                    command.CommandType = CommandType.StoredProcedure;
                    this.connection.Open();
                    SqlDataReader dr = command.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            addressModel.PersonId = dr.GetInt32(0);
                            addressModel.Firstname = dr.GetString(1);
                            addressModel.Lastname = dr.GetString(2);
                            addressModel.Address = dr.GetString(3);
                            addressModel.City = dr.GetString(4);
                            addressModel.State = dr.GetString(5);
                            addressModel.Zip = dr.GetInt32(6);
                            addressModel.MobileNumber = dr.GetString(7);
                            addressModel.EmailId = dr.GetString(8);
                            Console.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7},{8}", addressModel.PersonId, addressModel.Firstname, addressModel.Lastname
                                , addressModel.Address, addressModel.City, addressModel.State, addressModel.Zip, addressModel.MobileNumber, addressModel.EmailId);

                        }
                        dr.Close();
                        this.connection.Close();
                    }
                    else
                    {
                        Console.WriteLine("No data found");
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                this.connection.Close();
            }
        }
        public bool InsertData(AddressModel addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spAddInAddressBook", this.connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", addressModel.Firstname);
                    command.Parameters.AddWithValue("@LastName", addressModel.Lastname);
                    command.Parameters.AddWithValue("@Address", addressModel.Address);
                    command.Parameters.AddWithValue("@City", addressModel.City);
                    command.Parameters.AddWithValue("@State", addressModel.State);
                    command.Parameters.AddWithValue("@Zip", addressModel.Zip);
                    command.Parameters.AddWithValue("@MobileNumber", addressModel.MobileNumber);
                    command.Parameters.AddWithValue("@EmailId", addressModel.EmailId);
                    this.connection.Open();
                    var result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                this.connection.Close();
            }
        }

        public bool UpdateData(AddressModel addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spUpdateInAddressBook", this.connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", addressModel.Firstname);
                    command.Parameters.AddWithValue("@State", addressModel.State);
                    this.connection.Open();
                    var result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }
        public bool DeletePerson(AddressModel addressModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spDeleteInAddressBook", this.connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", addressModel.Firstname);
                    this.connection.Open();
                    var result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                this.connection.Close();
            }
        }
        public void RetrivePersonsCityOrState(AddressModel addressModel)
        {
            SqlConnection connection = new SqlConnection();
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand("spPersonsCityorState", this.connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@City", addressModel.City);
                    command.Parameters.AddWithValue("@State", addressModel.State);
                    this.connection.Open();
                    SqlDataReader dr = command.ExecuteReader();
                    //command.ExecuteNonQuery();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            addressModel.Firstname = dr.GetString(0);
                            addressModel.City = dr.GetString(1);
                            addressModel.State = dr.GetString(2);
                            Console.WriteLine(addressModel.Firstname + "," + addressModel.City + "," + addressModel.State);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Data not found");
                    }
                    dr.Close();
                    this.connection.Close();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                this.connection.Close();
            }
        }

    }
}
