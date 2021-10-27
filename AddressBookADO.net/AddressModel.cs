using System;
using System.Collections.Generic;
using System.Text;

namespace AddressBookADO.net
{
    public class AddressModel
    {
        public int PersonId { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public int Zip { get; set; }
        public string MobileNumber { get; set; }
        public string EmailId { get; set; }
        public string PersonType { get; set; }
        public string AddressBookName { get; set; }
    }
}
