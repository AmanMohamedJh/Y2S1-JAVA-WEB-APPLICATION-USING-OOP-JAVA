package model;

public class CustomerModel {
    private int CustomerID;
    private String CusName;
    private String CusEmail;
    private String UserName;
    private String Password;
    private String Phone;
    private String Address;

    public CustomerModel(int CustomerID, String CusName, String CusEmail, String UserName, String Password, String Phone, String Address) {
        this.CustomerID = CustomerID;
        this.CusName = CusName;
        this.CusEmail = CusEmail;
        this.UserName = UserName;
        this.Password = Password;
        this.Phone = Phone;
        this.Address = Address;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public String getCusName() {
        return CusName;
    }

    public String getCusEmail() {
        return CusEmail;
    }

    public String getUserName() {
        return UserName;
    }

    public String getPassword() {
        return Password;
    }

    public String getPhone() {
        return Phone;
    }

    public String getAddress() {
        return Address;
    }
}
