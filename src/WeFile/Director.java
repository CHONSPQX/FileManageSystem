package WeFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

public class Director {  
    public static String prePath = "F:/work/";
	
    public static boolean createFile(String destFileName) {  
        File file = new File(prePath + destFileName);  
        if(file.exists()) {  
            System.out.println("���������ļ�" + prePath + destFileName + "ʧ�ܣ�Ŀ���ļ��Ѵ��ڣ�");  
            return false;  
        }  
        if (destFileName.endsWith(File.separator)) {  
            System.out.println("���������ļ�" + prePath + destFileName + "ʧ�ܣ�Ŀ���ļ�����ΪĿ¼��");  
            return false;  
        }  
        //�ж�Ŀ���ļ����ڵ�Ŀ¼�Ƿ����  
        if(!file.getParentFile().exists()) {  
            //���Ŀ���ļ����ڵ�Ŀ¼�����ڣ��򴴽���Ŀ¼  
            System.out.println("Ŀ���ļ�����Ŀ¼�����ڣ�׼����������");  
            if(!file.getParentFile().mkdirs()) {  
                System.out.println("����Ŀ���ļ�����Ŀ¼ʧ�ܣ�");  
                return false;  
            }  
        }  
        //����Ŀ���ļ�  
        try {  
            if (file.createNewFile()) {  
                System.out.println("���������ļ�" +prePath +  destFileName + "�ɹ���");  
                return true;  
            } else {  
                System.out.println("���������ļ�" + prePath + destFileName + "ʧ�ܣ�");  
                return false;  
            }  
        } catch (IOException e) {  
            e.printStackTrace();  
            System.out.println("���������ļ�" + prePath + destFileName + "ʧ�ܣ�" + e.getMessage());  
            return false;  
        }  
    }  
     
     
    public static boolean createDir(String destDirName) {  
        File dir = new File( prePath + destDirName);  
        if (dir.exists()) {  
            System.out.println("����Ŀ¼" + destDirName + "ʧ�ܣ�Ŀ��Ŀ¼�Ѿ�����");  
            return false;  
        }  
        if (!destDirName.endsWith(File.separator)) {  
            destDirName = destDirName + File.separator;  
        }  
        //����Ŀ¼  
        if (dir.mkdirs()) {  
            System.out.println("����Ŀ¼" + destDirName + "�ɹ���");  
            return true;  
        } else {  
            System.out.println("����Ŀ¼" + destDirName + "ʧ�ܣ�");  
            return false;  
        }  
    }  
     
     
    public static String createTempFile(String prefix, String suffix, String dirName) {  
        File tempFile = null;  
        if (dirName == null) {  
            try{  
                //��Ĭ���ļ����´�����ʱ�ļ�  
                tempFile = File.createTempFile(prefix, suffix);  
                //������ʱ�ļ���·��  
                return tempFile.getCanonicalPath();  
            } catch (IOException e) {  
                e.printStackTrace();  
                System.out.println("������ʱ�ļ�ʧ�ܣ�" + e.getMessage());  
                return null;  
            }  
        } else {  
            File dir = new File(dirName);  
            //�����ʱ�ļ�����Ŀ¼�����ڣ����ȴ���  
            if (!dir.exists()) {  
                if (!Director.createDir(dirName)) {  
                    System.out.println("������ʱ�ļ�ʧ�ܣ����ܴ�����ʱ�ļ����ڵ�Ŀ¼��");  
                    return null;  
                }  
            }  
            try {  
                //��ָ��Ŀ¼�´�����ʱ�ļ�  
                tempFile = File.createTempFile(prefix, suffix, dir);  
                return tempFile.getCanonicalPath();  
            } catch (IOException e) {  
                e.printStackTrace();  
                System.out.println("������ʱ�ļ�ʧ�ܣ�" + e.getMessage());  
                return null;  
            }  
        }  
    }
    
    public static ArrayList<String> checkFile(String userId , String path)
    {
    	File dir = new File( prePath +userId + "/" +path);
        String[] strs = dir.list();
        ArrayList<String> all = new ArrayList<String>();
        for(String s : strs)
        	all.add(s);
        return all;
    }
}
