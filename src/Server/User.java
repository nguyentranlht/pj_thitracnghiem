/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server;

/**
 *
 */
public class User {
    private String email,matKhau,tenDayDu;
    private boolean gioiTinh;

    public User() {
    }

    public User(String email, String matKhau, String tenDayDu, boolean gioiTinh) {
        this.email = email;
        this.matKhau = matKhau;
        this.tenDayDu = tenDayDu;
        this.gioiTinh = gioiTinh;
    }

    public String getEmail() {
        return email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public String getTenDayDu() {
        return tenDayDu;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public void setTenDayDu(String tenDayDu) {
        this.tenDayDu = tenDayDu;
    }
    
}
