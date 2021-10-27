using AddressBookADO.net;
using NUnit.Framework;

namespace AddressBookADOTest
{
    public class Tests
    {

        AddressRepo addressRepo = new AddressRepo();
        [Test]
        public void InsertValueIntoPersonTable()
        {
            AddressModel addressModel = new AddressModel();
            addressModel.Firstname = "Joanne";
            addressModel.Lastname = "Pricilla";
            addressModel.Address = "WhiteField";
            addressModel.City = "Chennai";
            addressModel.State = "TamilNadu";
            addressModel.Zip = 779012;
            addressModel.MobileNumber = "8880852096";
            addressModel.EmailId = "Prici@gmail.com";
            bool result = addressRepo.InsertData(addressModel);
            Assert.IsTrue(result);
        }


        [Test]
        public void UpdateValueIntoPersonTable ()
        {
            AddressModel addressModel = new AddressModel();
            addressModel.Firstname = "Sachin";
            addressModel.State = "TamilNadu";
            bool result = addressRepo.UpdateData(addressModel);
            Assert.IsTrue(result);
        }

        [Test]
        public void DeletePerson()
        {
            AddressModel addressModel = new AddressModel();
            addressModel.Firstname = "Joanne";
            bool result = addressRepo.DeletePerson(addressModel);
            Assert.IsTrue(result);
        }


    }
}