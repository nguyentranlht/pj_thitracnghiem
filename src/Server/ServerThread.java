package Server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 * @author Pham Minh Hieu
 */
public class ServerThread implements Runnable {

    private Socket socket;
    private String name;
    private String email;
    private int count = 2;

    public ServerThread(Socket socket, String name) throws IOException {
        this.socket = socket;
        this.name = name;

        new Thread(this).start();
    }

    @Override
    public void run() {
        try {
            DataInputStream dis = new DataInputStream(socket.getInputStream());
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
            String receive = dis.readUTF();
            String receiveArray[] = receive.split("///");
            //int flag = flag(receiveArray[0]);
            switch (Integer.parseInt(receiveArray[0])) {
                case 1:
                    if (receiveArray[1].equals("localhost") && receiveArray[2].equals("1433")) {
                        System.out.println("Arrdress: " + receiveArray[1] + "\nPort: " + receiveArray[2]);
                        dos.writeUTF("Connected");
                    } else {
                        dos.writeUTF("Connected fail");
                    }
                    break;
                case 2:
                    System.out.print(receive);
                    if (ConnectDB.getConnect(receive) == true) {
                        dos.writeUTF("Connected");
                    } else {
                        dos.writeUTF("Connected fail");
                    }
                    break;
                case 3:
                    String[] arrStr = receive.split("///");
//                    System.out.println("Ho ten: " + arrStr[1] + "\nMSSV: " + arrStr[2] + "" + "\nSDT: " + arrStr[3]);
//                    if (ConnectDB.insertThongTin(receiveArray[1], receiveArray[2], receiveArray[3]) == true) {
//                        dos.writeUTF("Success");
//                    } else {
//                        dos.writeUTF("Connected fail");
//                    }
//                    break;
                    String otp = VerifyRegistration.generateOTP();
                    VerifyRegistration.sendEmail(arrStr[1], otp);
                    dos.writeUTF(otp);
                case 4:
                    System.out.println("Có Client đang thi trắc nghiệm...");
                    String strCauHoi = ConnectDB.getAllCauHoi();
                    String arrCauHoi[] = strCauHoi.split("///");
                    dos.writeUTF(strCauHoi);
                    String receiveAnswer = dis.readUTF();
                    System.out.println("Client đã trả lời: " + receiveAnswer);
                    String arrAnswer[] = receiveAnswer.split("///");
                    int cauDung = 0;
                    ArrayList<String> Answer = new ArrayList<>();
                    for (int i = 0; i < arrCauHoi.length; i += 7) {
                        Answer.add(arrCauHoi[i + 6]);
                    }
                    System.out.println(Answer);
                    for (int i = 0; i < arrAnswer.length; i++) {
                        if (Answer.get(i).equals(arrAnswer[i])) {
                            cauDung++;
                        }
                    }
                    System.out.println("Số câu đúng: " + cauDung);
                    dos.writeUTF(String.valueOf(cauDung));
                    break;
                case 5:
                    String[] arrStr1 = receive.split("///");
                    System.out.println("Email: " + arrStr1[1] + "\nMat Khau: " + arrStr1[2]);
                    {
                        try {
                            if (ConnectDB.CheckLogIn(receiveArray[1], receiveArray[2])== true) {
                                dos.writeUTF("Connected");
                            } else {
                                dos.writeUTF("Connected fail");
                            }
                        } catch (SQLException ex) {
                            Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    break;
                case 6:
                    String [] arrStr2 = receive.split("///");
                    email = "leduycoiytb@gmail.com";
                    String info = ConnectDB.getUserInfo(email);
                    dos.writeUTF(info);
                    break;
                case 7:
                    String[] req = receive.split("///");
                    boolean isMale = true ? req[2].equals("1 ") : false;
                    ConnectDB.updateUser(req[1], isMale, req[3], req[4]);
                    dos.writeUTF("Updated");
                    break;
                case 8:
                    String[] str8 = receive.split("///");
                    int examID = Integer.parseInt(str8[1]);
                    int subjectID = ConnectDB.getSubjectID(str8[2]);
                    int userID = ConnectDB.getAuthorID(str8[3]);
                    int kyThiID = ConnectDB.getExamID(str8[4]);
                    int soCauHoi = Integer.parseInt(str8[5]);
                    int time = Integer.parseInt(str8[6]);
                    try {
                        if(ConnectDB.insertExam(examID, subjectID, userID, kyThiID, soCauHoi ,time) == true){
                            dos.writeUTF("Inserted");
                        }
                        else{
                            dos.writeUTF("Inserted fail");
                        }
                    } catch (Exception e) {
                        Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, e);
                    }
                    break;
                case 9:
                    String[] str9 = receive.split("///");
                    int quesID = Integer.parseInt(str9[1]);
                    int examid = Integer.parseInt(str9[3]);
                    try {
                        if(ConnectDB.insertQues(quesID, str9[2], examid, str9[4], str9[5], str9[6], str9[7], str9[8])== true){
                            dos.writeUTF("Inserted");
                        }
                        else{
                            dos.writeUTF("Inserted fail");
                        }
                    } catch (Exception e) {
                        Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, e);
                    }
                case 10:
                    String[] user = receive.split("///");
                    boolean isFMale = true ? user[4].equals("fmale") : false;
                    try {
                        if (ConnectDB.insertUser(count,user[1], user[2], user[3], isFMale, user[5].trim()) == true) {
                            dos.writeUTF("Inserted");
                            count++;
                        } else {
                            dos.writeUTF("Inserted fail");
                        }
                    } catch (Exception e) {
                        Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, e);
                    }
                    
            }
        } catch (IOException ex) {
            Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                socket.close();
            } catch (IOException ex) {
                Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
