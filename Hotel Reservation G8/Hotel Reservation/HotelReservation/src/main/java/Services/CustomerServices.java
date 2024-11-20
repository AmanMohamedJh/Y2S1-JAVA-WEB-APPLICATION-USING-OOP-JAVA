package Services;

import java.sql.Connection;
import java.sql.Statement;
import Controller.DBConnect;

public class CustomerServices {

    public static boolean insertdata(String CusName, String CusEmail, String UserName, String Password, String Phone, String Address) {
        boolean isSuccess = false;

        try {
            Connection conn = DBConnect.getConnection();
            Statement stmt = conn.createStatement();

            String sql = "INSERT INTO customer (CusName, CusEmail, UserName, Password, Phone, Address) VALUES "
                    + "('" + CusName + "','" + CusEmail + "','" + UserName + "','" + Password + "','" + Phone + "','" + Address + "')";

            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
    
}
