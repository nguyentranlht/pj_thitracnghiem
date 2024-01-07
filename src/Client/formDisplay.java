        /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

import Server.CauHoi;
import Server.Exams;
import Server.KetQua;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC
 */
public class formDisplay extends javax.swing.JFrame {

    /**
     * Creates new form formDisplay
     */
    Socket socket;
    DataInputStream dis;
    DataOutputStream dos;
    int soCau = 0;
    private static int timer = 30;
    int current = -1;
    int dem = 0;
    ArrayList<Exams> listDe = null;
    ArrayList cauChon = null;
    public formDisplay() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnGender = new javax.swing.ButtonGroup();
        btnDapAn = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        tabControl = new javax.swing.JTabbedPane();
        tabQLDT = new javax.swing.JPanel();
        tabThi = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblBoDe = new javax.swing.JTable();
        tabUser = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtName = new javax.swing.JTextField();
        txtEmail = new javax.swing.JTextField();
        rbtnMale = new javax.swing.JRadioButton();
        rbtnFmale = new javax.swing.JRadioButton();
        dateChooser = new com.toedter.calendar.JDateChooser();
        btnSignUp = new javax.swing.JButton();
        txtID = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tabControl.setTabPlacement(javax.swing.JTabbedPane.LEFT);
        tabControl.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentShown(java.awt.event.ComponentEvent evt) {
                tabControlComponentShown(evt);
            }
        });

        javax.swing.GroupLayout tabQLDTLayout = new javax.swing.GroupLayout(tabQLDT);
        tabQLDT.setLayout(tabQLDTLayout);
        tabQLDTLayout.setHorizontalGroup(
            tabQLDTLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1027, Short.MAX_VALUE)
        );
        tabQLDTLayout.setVerticalGroup(
            tabQLDTLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 650, Short.MAX_VALUE)
        );

        tabControl.addTab("Quản Lý Đề Thi", new javax.swing.ImageIcon(getClass().getResource("/image/quanly.png")), tabQLDT); // NOI18N

        tabThi.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentShown(java.awt.event.ComponentEvent evt) {
                tabThiComponentShown(evt);
            }
        });

        jScrollPane1.addAncestorListener(new javax.swing.event.AncestorListener() {
            public void ancestorMoved(javax.swing.event.AncestorEvent evt) {
            }
            public void ancestorAdded(javax.swing.event.AncestorEvent evt) {
                jScrollPane1AncestorAdded(evt);
            }
            public void ancestorRemoved(javax.swing.event.AncestorEvent evt) {
            }
        });
        jScrollPane1.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentShown(java.awt.event.ComponentEvent evt) {
                jScrollPane1ComponentShown(evt);
            }
        });

        tblBoDe.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Tiêu Đề", "Người Tạo", "Số Câu", "Thời Gian"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblBoDe.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblBoDeMouseClicked(evt);
            }
        });
        tblBoDe.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentShown(java.awt.event.ComponentEvent evt) {
                tblBoDeComponentShown(evt);
            }
        });
        jScrollPane1.setViewportView(tblBoDe);

        javax.swing.GroupLayout tabThiLayout = new javax.swing.GroupLayout(tabThi);
        tabThi.setLayout(tabThiLayout);
        tabThiLayout.setHorizontalGroup(
            tabThiLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, tabThiLayout.createSequentialGroup()
                .addContainerGap(35, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 963, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29))
        );
        tabThiLayout.setVerticalGroup(
            tabThiLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tabThiLayout.createSequentialGroup()
                .addGap(63, 63, 63)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 400, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(187, Short.MAX_VALUE))
        );

        tabControl.addTab("          Thi         ", new javax.swing.ImageIcon(getClass().getResource("/image/thi.png")), tabThi, ""); // NOI18N

        jLabel2.setText("Email");

        jLabel3.setText("Tên Người Dùng");

        jLabel5.setText("Mã Định Danh");

        jLabel6.setText("Giới Tính");

        jLabel7.setText("Ngày Sinh");

        txtEmail.setEditable(false);

        btnGender.add(rbtnMale);
        rbtnMale.setText("Nam");

        btnGender.add(rbtnFmale);
        rbtnFmale.setText("Nữ");

        btnSignUp.setText("Cập Nhật Thông Tin");

        txtID.setEditable(false);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(27, 27, 27)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtID, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel7))
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                            .addComponent(txtName, javax.swing.GroupLayout.DEFAULT_SIZE, 206, Short.MAX_VALUE)
                                            .addComponent(txtEmail)
                                            .addComponent(dateChooser, javax.swing.GroupLayout.DEFAULT_SIZE, 206, Short.MAX_VALUE)))
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addGap(42, 42, 42)
                                        .addComponent(rbtnMale)
                                        .addGap(53, 53, 53)
                                        .addComponent(rbtnFmale))))))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(147, 147, 147)
                        .addComponent(btnSignUp)))
                .addContainerGap(117, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(104, 104, 104)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtID, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtName, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtEmail, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(rbtnMale, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(rbtnFmale, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(181, 181, 181))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(dateChooser, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(35, 35, 35)
                        .addComponent(btnSignUp)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );

        jLabel1.setFont(new java.awt.Font("Segoe UI", 3, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("THÔNG TIN CÁ NHÂN");

        javax.swing.GroupLayout tabUserLayout = new javax.swing.GroupLayout(tabUser);
        tabUser.setLayout(tabUserLayout);
        tabUserLayout.setHorizontalGroup(
            tabUserLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tabUserLayout.createSequentialGroup()
                .addContainerGap(345, Short.MAX_VALUE)
                .addGroup(tabUserLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, tabUserLayout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 545, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(137, 137, 137))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, tabUserLayout.createSequentialGroup()
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(179, 179, 179))))
        );
        tabUserLayout.setVerticalGroup(
            tabUserLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tabUserLayout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 71, Short.MAX_VALUE)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(56, 56, 56))
        );

        tabControl.addTab("   Người Dùng ", new javax.swing.ImageIcon(getClass().getResource("/image/user.png")), tabUser); // NOI18N

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1027, Short.MAX_VALUE)
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 650, Short.MAX_VALUE)
        );

        tabControl.addTab("   Thống Kê    ", new javax.swing.ImageIcon(getClass().getResource("/image/thongke.png")), jPanel5); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(tabControl)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(tabControl)
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
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tabControlComponentShown(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_tabControlComponentShown
        // TODO add your handling code here:
        
    }//GEN-LAST:event_tabControlComponentShown

    private void tabThiComponentShown(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_tabThiComponentShown
        // TODO add your handling code here:
    }//GEN-LAST:event_tabThiComponentShown

    private void jScrollPane1ComponentShown(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_jScrollPane1ComponentShown
        // TODO add your handling code here:
    }//GEN-LAST:event_jScrollPane1ComponentShown

    private void jScrollPane1AncestorAdded(javax.swing.event.AncestorEvent evt) {//GEN-FIRST:event_jScrollPane1AncestorAdded
        // TODO add your handling code here
    }//GEN-LAST:event_jScrollPane1AncestorAdded

    private void tblBoDeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblBoDeMouseClicked
        // TODO add your handling code here:
//        int viTriDongVuaBam = tblBoDe.getSelectedRow();
//        ckbStatus.setSelected((boolean)tblBoDe.getValueAt(viTriDongVuaBam, 1));
//        setSelectedCombobox(tblBoDe.getValueAt(viTriDongVuaBam, 2).toString(),cmbCatagory);
//        txtID.setText(tblBoDe.getValueAt(viTriDongVuaBam, 3).toString());
//        txtItem.setText(tblBoDe.getValueAt(viTriDongVuaBam, 4).toString());
//        spinPrice.setValue(tblBoDe.getValueAt(viTriDongVuaBam, 5));
//        cmbUnit.setSelectedItem(tblBoDe.getValueAt(viTriDongVuaBam, 6).toString());
//        txtCmt.setText(tblBoDe.getValueAt(viTriDongVuaBam, 7).toString());
    }//GEN-LAST:event_tblBoDeMouseClicked

    private void tblBoDeComponentShown(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_tblBoDeComponentShown
        // TODO add your handling code here:
        System.out.println("Client.formDisplay.tblBoDeComponentShown()");
        ListBoDe();
    }//GEN-LAST:event_tblBoDeComponentShown
   public void ListBoDe() {
        try {
            socket = new Socket("localhost", 8000);
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
            String flag = "6";
            dos.writeUTF(flag);
            String receive = dis.readUTF();
            String[] arrStr = receive.split("///");
            DefaultTableModel model = new DefaultTableModel();
            model.addColumn("Dữ liệu");

            for (String value : arrStr) {
                model.addRow(new Object[]{value});
            }

            tblBoDe.setModel(model);

//            DefaultTableModel tableModel = (DefaultTableModel)tblBoDe.getModel();
//            tableModel.setRowCount(0);
//            for (int i = 0; i < arrStr.length; i += 5) {
//                Object[] item = new Object[5];                    
//                item[0] =(Integer.parseInt(arrStr[i]));
//                item[1] =(arrStr[i+1]);
//                item[2] =(arrStr[i+2]);
//                item[3] =(Integer.parseInt(arrStr[i+3]));
//                item[4] =((arrStr[i+4]));
//                tableModel.addRow(item);
//            }  
//            tblBoDe.setModel(tableModel);
        } catch (IOException ex) {
            Logger.getLogger(formClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
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
            java.util.logging.Logger.getLogger(formDisplay.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(formDisplay.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(formDisplay.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(formDisplay.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new formDisplay().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup btnDapAn;
    private javax.swing.ButtonGroup btnGender;
    private javax.swing.JButton btnSignUp;
    private com.toedter.calendar.JDateChooser dateChooser;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JRadioButton rbtnFmale;
    private javax.swing.JRadioButton rbtnMale;
    private javax.swing.JTabbedPane tabControl;
    private javax.swing.JPanel tabQLDT;
    private javax.swing.JPanel tabThi;
    private javax.swing.JPanel tabUser;
    private javax.swing.JTable tblBoDe;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtID;
    private javax.swing.JTextField txtName;
    // End of variables declaration//GEN-END:variables
}
