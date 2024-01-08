/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Client;

import Server.CauHoi;
import Server.KetQua;
import Server.Exams;
import javax.swing.*;
import java.awt.*;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Pham Minh Hieu
 */
public final class formThiTN extends javax.swing.JFrame {

    Socket socket;
    DataInputStream dis;
    DataOutputStream dos;
    int soCau = 0;
    private static int timer ;
    int current = -1;
    int dem = 0;
    String DapAn;
    ArrayList<CauHoi> listCauhoi = null;
    ArrayList cauChon = null;
    ArrayList<String> Answer = new ArrayList<>();

    /**
     * Creates new form formThiTracNghiem
     */
    public formThiTN() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.setTitle("THI TRẮC NGHIỆM");
        listCauhoi = new ArrayList();
        cauChon = new ArrayList();
        timer = Exams.thoigian;        
        ThiTracNghiem(Exams.made, Exams.socau);
    }

    @Override
    public void paint(Graphics g) {
        super.paint(g);
        int minutes = timer / 60; // Chia timer cho 60 để lấy phút
        int seconds = timer % 60; // Lấy phần dư để lấy giây

        String time = " Timer : " + minutes + " phút " + seconds + " giây";
        g.setColor(Color.RED);
        g.setFont(new Font("Tahoma", Font.BOLD, 21));

        if (timer > 0) {
            g.drawString(time, 30, 80);
        } else {
            g.drawString("Hết giờ", 30, 80);
            //timer = 31 * 60; // Reset timer về 31 phút
            try {
                cauHoiKeTiep();
            } catch (InterruptedException | IOException ex) {
                Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        timer--; // Giảm timer đi 1 giây

        try {
            Thread.sleep(1000);
            repaint();
        } catch (InterruptedException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void cauHoiKeTiep() throws IOException, InterruptedException {
        current++;
        jRadioButtonCauA.setForeground(Color.BLACK);
        jRadioButtonCauB.setForeground(Color.BLACK);
        jRadioButtonCauC.setForeground(Color.BLACK);
        jRadioButtonCauD.setForeground(Color.BLACK);
        if (current > 0) {
            if (jRadioButtonCauA.isSelected()) {
                jRadioButtonCauA.setSelected(false);
                cauChon.add("A");
                System.out.println("Ban vua chon dap an A\n");
            } else if (jRadioButtonCauB.isSelected()) {
                jRadioButtonCauB.setSelected(false);
                cauChon.add("B");
                System.out.println("Ban vua chon dap an B\n");
            } else if (jRadioButtonCauC.isSelected()) {
                jRadioButtonCauC.setSelected(false);
                cauChon.add("C");
                System.out.println("Ban vua chon dap an C\n");
            } else if (jRadioButtonCauD.isSelected()) {
                cauChon.add("D");
                jRadioButtonCauD.setSelected(false);
                System.out.println("Ban vua chon dap an D\n");
            } else {
                cauChon.add("E");
                System.out.println("E");
            }
        }

        if (current < soCau) {
            dem++;
            CauHoi CH = listCauhoi.get(current);
            System.out.println("Câu " + dem + ". " + CH.getNoiDung());
            jLabelCauHoi.setText("Câu " + dem + ". " + CH.getNoiDung());
            System.out.println("A. " + CH.getCauA());
            jRadioButtonCauA.setText("A. " + CH.getCauA());
            System.out.println("B. " + CH.getCauB());
            jRadioButtonCauB.setText("B. " + CH.getCauB());
            System.out.println("C. " + CH.getCauC());
            jRadioButtonCauC.setText("C. " + CH.getCauC());
            System.out.println("D. " + CH.getCauD());
            jRadioButtonCauD.setText("D. " + CH.getCauD());
            DapAn = Answer.get(current);
            if (dem == soCau) {
                jButtonTiepTheo.setText("NỘP BÀI");
            }
        } else {
            String send = "";
            for (int i = 0; i < cauChon.size(); i++) {
                send += cauChon.get(i) + "///";
            }
            dos.writeUTF(send);
            String diem = dis.readUTF();
            System.out.println("Điểm của bạn là: " + diem);
            KetQua.soCauDung = diem;
            JOptionPane.showMessageDialog(null, "Bạn đã hoàn thành bài thi!! Nộp bài!");
            this.setVisible(false);
            formKetQua KQ = new formKetQua();
            KQ.setVisible(true);
            socket.close();
        }
    }

    public void ThiTracNghiem(int made, int socau) {
        try {
            socket = new Socket("localhost", 8000);
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
            String flag = "4";
            flag += "///";
            flag += made;
            flag += "///";
            flag += socau;
            flag += "///";
            dos.writeUTF(flag);
            String receive = dis.readUTF();
            String[] arrStr = receive.split("///");
            int i = 0;
            int dem = 0;
            for (i = 0; i < arrStr.length; i += 7) {
                if (dem < socau) {
                    CauHoi CH = new CauHoi();
                    CH.setCauHoi(Integer.parseInt(arrStr[i]));
                    CH.setNoiDung(arrStr[i + 1]);
                    CH.setCauA(arrStr[i + 2]);
                    CH.setCauB(arrStr[i + 3]);
                    CH.setCauC(arrStr[i + 4]);
                    CH.setCauD(arrStr[i + 5]);
                    Answer.add(arrStr[i + 6]);
                    listCauhoi.add(CH);
                }
                dem++;
            }

            soCau = listCauhoi.size();
            cauHoiKeTiep();
        } catch (IOException ex) {
            Logger.getLogger(formClient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void KetQua() throws IOException, InterruptedException {
        jRadioButtonCauA.setForeground(Color.RED);
        jRadioButtonCauB.setForeground(Color.RED);
        jRadioButtonCauC.setForeground(Color.RED);
        jRadioButtonCauD.setForeground(Color.RED);
        String dapan = Answer.get(current).trim();
        System.out.println(dapan);
        switch (dapan) {
            case "A":
                jRadioButtonCauA.setForeground(Color.GREEN);
                break;
            case "B":
                jRadioButtonCauB.setForeground(Color.GREEN);
                break;
            case "C":
                jRadioButtonCauC.setForeground(Color.GREEN);
                break;
            case "D":
                jRadioButtonCauD.setForeground(Color.GREEN);
                break;
            default:
                break;
        }

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroupDapAn = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jRadioButtonCauA = new javax.swing.JRadioButton();
        jRadioButtonCauB = new javax.swing.JRadioButton();
        jRadioButtonCauC = new javax.swing.JRadioButton();
        jRadioButtonCauD = new javax.swing.JRadioButton();
        jLabelCauHoi = new javax.swing.JLabel();
        jButtonTiepTheo = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));
        setResizable(false);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setPreferredSize(new java.awt.Dimension(900, 500));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 3, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("THI TRẮC NGHIỆM");

        buttonGroupDapAn.add(jRadioButtonCauA);
        jRadioButtonCauA.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jRadioButtonCauA.setText("A.");
        jRadioButtonCauA.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonCauAActionPerformed(evt);
            }
        });

        buttonGroupDapAn.add(jRadioButtonCauB);
        jRadioButtonCauB.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jRadioButtonCauB.setText("B.");
        jRadioButtonCauB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonCauBActionPerformed(evt);
            }
        });

        buttonGroupDapAn.add(jRadioButtonCauC);
        jRadioButtonCauC.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jRadioButtonCauC.setText("C.");
        jRadioButtonCauC.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonCauCActionPerformed(evt);
            }
        });

        buttonGroupDapAn.add(jRadioButtonCauD);
        jRadioButtonCauD.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jRadioButtonCauD.setText("D.");
        jRadioButtonCauD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButtonCauDActionPerformed(evt);
            }
        });

        jLabelCauHoi.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabelCauHoi.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabelCauHoi.setText("CÂU 1. ");

        jButtonTiepTheo.setText("TIẾP THEO");
        jButtonTiepTheo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonTiepTheoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 900, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jRadioButtonCauD, javax.swing.GroupLayout.PREFERRED_SIZE, 800, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jRadioButtonCauC, javax.swing.GroupLayout.PREFERRED_SIZE, 800, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jRadioButtonCauB, javax.swing.GroupLayout.PREFERRED_SIZE, 800, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jRadioButtonCauA, javax.swing.GroupLayout.PREFERRED_SIZE, 800, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabelCauHoi, javax.swing.GroupLayout.PREFERRED_SIZE, 800, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(50, 50, 50)))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(405, 405, 405)
                .addComponent(jButtonTiepTheo, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(405, 405, 405))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 36, Short.MAX_VALUE)
                .addComponent(jLabelCauHoi, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jRadioButtonCauA, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(32, 32, 32)
                .addComponent(jRadioButtonCauB, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 36, Short.MAX_VALUE)
                .addComponent(jRadioButtonCauC, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 34, Short.MAX_VALUE)
                .addComponent(jRadioButtonCauD, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addComponent(jButtonTiepTheo, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(42, 42, 42))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonTiepTheoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonTiepTheoActionPerformed
        // TODO add your handling code here:
        try {
            cauHoiKeTiep();
        } catch (IOException ex) {
            java.util.logging.Logger.getLogger(formThiTN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            java.util.logging.Logger.getLogger(formThiTN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButtonTiepTheoActionPerformed

    private void jRadioButtonCauAActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonCauAActionPerformed
        try {
            // TODO add your handling code here:
            KetQua();
        } catch (IOException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jRadioButtonCauAActionPerformed

    private void jRadioButtonCauBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonCauBActionPerformed
        try {
            // TODO add your handling code here:
            KetQua();
        } catch (IOException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jRadioButtonCauBActionPerformed

    private void jRadioButtonCauCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonCauCActionPerformed
        try {
            // TODO add your handling code here:
            KetQua();
        } catch (IOException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(formThiTN.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jRadioButtonCauCActionPerformed

    private void jRadioButtonCauDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButtonCauDActionPerformed

    }//GEN-LAST:event_jRadioButtonCauDActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(formThiTN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(formThiTN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(formThiTN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(formThiTN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new formThiTN().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroupDapAn;
    private javax.swing.JButton jButtonTiepTheo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabelCauHoi;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JRadioButton jRadioButtonCauA;
    private javax.swing.JRadioButton jRadioButtonCauB;
    private javax.swing.JRadioButton jRadioButtonCauC;
    private javax.swing.JRadioButton jRadioButtonCauD;
    // End of variables declaration//GEN-END:variables
}
