/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Server;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.awt.AppContext;

/**
 * @author Pham Minh Hieu
 */
public class ConnectDB {

    public static Connection getConnection() {
        try {
            String dbURL = "jdbc:sqlserver://localhost;databaseName=ThiTracNghiem;user=sa;password=08012003";
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

    public static boolean insertExam(int examID, int subjectID, int authorID, int kyThiID, int soCauHoi, int ThoiGianThi) {
        boolean check = false;
        Connection conn = getConnection();
        String query = "{CALL AddNewExam(?, ?, ?, ?, ?, ?)}";
        try {
            CallableStatement callableStatement = conn.prepareCall(query);
            callableStatement.setInt(1, examID);  // Thiết lập giá trị cho tham số 1
            callableStatement.setInt(2, subjectID);  // Thiết lập giá trị cho tham số 2
            callableStatement.setInt(3, authorID);
            callableStatement.setInt(4, kyThiID);
            callableStatement.setInt(5, soCauHoi);
            callableStatement.setInt(6, ThoiGianThi);
            callableStatement.execute();
            check = true;
        } catch (Exception e) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return check;
    }

    public static boolean insertQues(int quesID, String ques, int examID, String a, String b, String c, String d, String dapAn) {
        boolean check = false;
        Connection conn = getConnection();
        String query = "{CALL AddNewQuestion(?, ?, ?, ?, ?, ?, ?, ?)}";
        try {
            CallableStatement callableStatement = conn.prepareCall(query);
            callableStatement.setInt(1, quesID);
            callableStatement.setString(2, ques);
            callableStatement.setInt(3, examID);
            callableStatement.setString(4, a);
            callableStatement.setString(5, b);
            callableStatement.setString(6, c);
            callableStatement.setString(7, d);
            callableStatement.setString(8, dapAn);
            callableStatement.execute();
            check = true;
        } catch (Exception e) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return check;
    }

    public static boolean insertUser(int id, String pw, String name, String email, boolean isMale, String dob) {
        boolean check = false;
        Connection conn = getConnection();
        String query = "{CALL InsertUser(?, ?, ?, ?, ?, ?)}";
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            CallableStatement callableStatement = conn.prepareCall(query);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, pw);
            callableStatement.setString(3, name);
            callableStatement.setString(4, email);
            callableStatement.setBoolean(5, isMale);
            callableStatement.setDate(6, Date.valueOf(dob));
            callableStatement.execute();
            check = true;
        } catch (Exception e) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return check;
    }

    public static String getAllCauHoi() {
        int[] soCau = new int[40];
        Arrays.fill(soCau, 0);
        Connection conn = getConnection();
        String sql = "{CALL GETTABLEQUESTION()}";
        Random rand = new Random();
        int dem = 0;
        while (dem < 10) {
            int k = rand.nextInt(32);
            if (soCau[k] != 1) {
                soCau[k] = 1;
                dem++;
            }
        }
        dem = -1;
        String str = "";
        try {
            PreparedStatement ptsm = conn.prepareStatement(sql);
            ResultSet rs = ptsm.executeQuery();
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

    public static String getUserInfo(String email) {
        String str = "";
        try {
            Connection conn = getConnection();
            String query = "Select * from Users where Email ='" + email + "'";
            PreparedStatement ptsm = conn.prepareStatement(query);
            ResultSet rs = ptsm.executeQuery();
            if (rs.next()) {
                str += rs.getString("UserID");
                str += "///";
                str += rs.getString("HoTen");
                str += "///";
                str += rs.getString("Email");
                str += "///";
                str += rs.getString("GioiTinh");
                str += "///";
                str += rs.getString("NgaySinh");
                str += "///";
            }
        } catch (Exception e) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return str;
    }

    public static void updateUser(String name, boolean isMale, String dateOfBirth, String email) throws ParseException {
        Connection conn = getConnection();
        String query = "{call UpdateUserInformation(?, ?, ?, ?)}";
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            CallableStatement callableStatement = conn.prepareCall(query);
            callableStatement.setString(1, name);  // Thiết lập giá trị cho tham số 1
            callableStatement.setBoolean(2, isMale);  // Thiết lập giá trị cho tham số 2
            callableStatement.setDate(3, Date.valueOf(dateOfBirth));
            callableStatement.setString(4, email);
            callableStatement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<String> getAllSubjects() throws SQLException {
        Connection conn = getConnection();
        String query = "SELECT TenMonHoc FROM Subjects";
        PreparedStatement ptsm = conn.prepareStatement(query);
        ResultSet rs = ptsm.executeQuery();
        List<String> subjects = new ArrayList<>();
        while (rs.next()) {
            subjects.add(rs.getString("TenMonHoc"));
        }
        return subjects;
    }

    public static List<String> getAllKyThi() throws SQLException {
        Connection conn = getConnection();
        String query = "Select * from LichThi";
        PreparedStatement ptsm = conn.prepareStatement(query);
        ResultSet rs = ptsm.executeQuery();
        List<String> kyThi = new ArrayList<>();
        while (rs.next()) {
            kyThi.add(rs.getString("TenKyThi"));
        }
        return kyThi;
    }

    public static int getExamID(String examName) throws SQLException {
        Connection conn = getConnection();
        String query = "SELECT LichThiID FROM LichThi WHERE TenKyThi = ?";
        PreparedStatement ptsm = conn.prepareStatement(query);
        ptsm.setString(1, examName);
        ResultSet rs = ptsm.executeQuery();
        if (rs.next()) {
            return rs.getInt("LichThiID");
        }
        return -1;
    }

    public static int getSubjectID(String subjectName) throws SQLException {
        Connection conn = getConnection();
        String query = "SELECT * FROM Subjects WHERE TenMonHoc = ?";
        PreparedStatement ptsm = conn.prepareStatement(query);
        ptsm.setString(1, subjectName);
        ResultSet rs = ptsm.executeQuery();
        if (rs.next()) {
            return rs.getInt("SubjectID");
        }
        return -1;
    }

    public static int getAuthorID(String authorName) throws SQLException {
        Connection conn = getConnection();
        String query = "Select UserID from Users where HoTen = ?";
        PreparedStatement ptsm = conn.prepareStatement(query);
        ptsm.setString(1, authorName);
        ResultSet rs = ptsm.executeQuery();
        if (rs.next()) {
            return rs.getInt("UserID");
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(getAllCauHoi());
    }
}
