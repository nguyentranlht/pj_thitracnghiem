/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server;

/**
 *
 * @author PC
 */
public class Exams {
    public String tieuDe, nguoiTao;
    public int examID, soCau, thoiGian;

    public Exams() {
    }

    public Exams(String tieuDe, String nguoiTao, int examID, int soCau, int thoiGian) {
        this.tieuDe = tieuDe;
        this.nguoiTao = nguoiTao;
        this.examID = examID;
        this.soCau = soCau;
        this.thoiGian = thoiGian;
    }

    public int getExamID() {
        return examID;
    }

   

    public String getNguoiTao() {
        return nguoiTao;
    }

    public int getSoCau() {
        return soCau;
    }

    public int getThoiGian() {
        return thoiGian;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    

    public void setNguoiTao(String nguoiTao) {
        this.nguoiTao = nguoiTao;
    }

    public void setSoCau(int soCau) {
        this.soCau = soCau;
    }

    public void setThoiGian(int thoiGian) {
        this.thoiGian = thoiGian;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }
    
}
