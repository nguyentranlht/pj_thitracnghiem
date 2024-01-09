/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Server;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

/**
 * @author Pham Minh Hieu
 */
public class ConnectDB {

    public static Connection getConnection() {
        try {
            String dbURL = "jdbc:sqlserver://localhost;databaseName=ThiTracNghiem;user=Nguyen;password=123456789";
            Connection conn = DriverManager.getConnection(dbURL);
            return conn;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean getConnect(String str) {
        boolean check = false;
        Connection conn = null;
        String[] arrStr = str.split("///");
        System.out.println("\nServername: " + arrStr[1] + "\nUsername: " + arrStr[2] + "\nPassword: " + arrStr[3]);
        String ServerName = arrStr[1];
        String name = arrStr[2];
        String pass = arrStr[3];
        String url = "jdbc:sqlserver://" + ServerName + ";databaseName=ThiTracNghiem;user=" + name + ";password=" + pass;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, name, pass);
            if (conn != null) {
                System.out.println("Successful connection to database!!");
                check = true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public static String getAllExams() {
        Connection conn = getConnection();
        String sql = "{CALL GETLISTEXAMS()}";
        String str = "";
        try {
            PreparedStatement ptsm = conn.prepareStatement(sql);
            ResultSet rs = ptsm.executeQuery();
            while (rs.next()) {
                str += rs.getString("ExamID");
                str += "///";
                str += rs.getString("Exam");
                str += "///";
                str += rs.getString("HoTen");
                str += "///";
                str += rs.getString("SoCauHoi");
                str += "///";
                str += rs.getString("ThoiGianThi");
                str += "///";
            }
            System.out.println(str);
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
        return str;
    }

    public static boolean insertThongTin(String s, String s1, String s2) {
        boolean check = false;
        Connection conn = getConnection();
        String sql = "INSERT INTO SINHVIEN(MASV,HOTEN,SODIENTHOAI) VALUES('" + s1 + "','" + s + "','" + s2 + "')";
        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            check = true;
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public static String getAllCauHoi(int made, int socau) {
        int[] soCau = new int[socau];
        Arrays.fill(soCau, 0);
        Connection conn = getConnection();
        String sql = "{CALL GETTABLEQUESTION(?)}";
        Random rand = new Random();
        int dem = 0;
        while (dem < socau) {
            int k = rand.nextInt(socau);
            if (soCau[k] != 1) {
                soCau[k] = 1;
                dem++;
            }
        }
        dem = -1;
        String str = "";
        try {
            CallableStatement callableStatement = conn.prepareCall(sql);
            callableStatement.setInt(1, made);  // Thiết lập giá trị cho tham số 1
            ResultSet rs = callableStatement.executeQuery();// Thực thi Stored Procedure          
            while (rs.next()) {
                dem++;
                if (soCau[dem] > 0) {
                    str += rs.getString("QuestionID");
                    str += "///";
                    str += rs.getString("NoiDungCauHoi");
                    str += "///";
                    str += rs.getString("A");
                    str += "///";
                    str += rs.getString("B");
                    str += "///";
                    str += rs.getString("C");
                    str += "///";
                    str += rs.getString("D");
                    str += "///";
                    str += rs.getString("DapAn");
                    str += "///";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return str;
    }

    public static boolean CheckLogIn(String Users, String MatKhau) throws SQLException {
        Connection conn = getConnection();
        String sql = "{call UserLogin(?, ?, ?)}";  // Tên của Stored Procedure và số lượng tham số
        CallableStatement callableStatement = conn.prepareCall(sql);
        callableStatement.setString(1, Users);  // Thiết lập giá trị cho tham số 1
        callableStatement.setString(2, MatKhau);  // Thiết lập giá trị cho tham số 2
        callableStatement.registerOutParameter(3, Types.BIT);  // Đăng ký tham số đầu ra
        // Thực thi Stored Procedure
        callableStatement.execute();
        // Lấy kết quả từ tham số đầu ra
        boolean loginSuccess = callableStatement.getBoolean(3);
        return loginSuccess;
    }

    public static String layDiem(int made) throws SQLException {
        Connection conn = getConnection();
        String sql = "{call CalculateStatistics(?)}";  // Tên của Stored Procedure và số lượng tham số
        CallableStatement callableStatement = conn.prepareCall(sql);
        callableStatement.setInt(1, made);
        ResultSet rs = callableStatement.executeQuery();// Thực thi Stored Procedure  
        String str = "";
        while (rs.next()) {
            str += rs.getFloat("MaxValue");
            str += "///";
            str += rs.getFloat("MinValue");
            str += "///";
            str += rs.getFloat("AverageValue");
            str += "///";
            str += rs.getInt("TotalCount");
            str += "///";
            System.out.println(str);
        }
        return str;
    }

    public static void updateCore(String mssv, int diem, String ngayThi) {
        Connection conn = getConnection();
        String sql = "UPDATE SINHVIEN SET DIEM = '" + diem + "', NGAYTHI = '" + ngayThi + "' WHERE MASV LIKE '" + mssv + "'";
        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        System.out.println(getAllExams());
    }
}
