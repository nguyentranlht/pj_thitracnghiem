/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 */
public class CauHoi {

    private int cauHoi;
    private String noiDung, CauA, CauB, CauC, CauD;

    public CauHoi() {
    }

    public CauHoi(int cauHoi, String noiDung, String CauA, String CauB, String CauC, String CauD) {
        this.cauHoi = cauHoi;
        this.noiDung = noiDung;
        this.CauA = CauA;
        this.CauB = CauB;
        this.CauC = CauC;
        this.CauD = CauD;
    }

    public int getCauHoi() {
        return cauHoi;
    }

    public void setCauHoi(int cauHoi) {
        this.cauHoi = cauHoi;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getCauA() {
        return CauA;
    }

    public void setCauA(String CauA) {
        this.CauA = CauA;
    }

    public String getCauB() {
        return CauB;
    }

    public void setCauB(String CauB) {
        this.CauB = CauB;
    }

    public String getCauC() {
        return CauC;
    }

    public void setCauC(String CauC) {
        this.CauC = CauC;
    }

    public String getCauD() {
        return CauD;
    }

    public void setCauD(String CauD) {
        this.CauD = CauD;
    }
}
