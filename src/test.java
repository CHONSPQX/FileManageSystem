import WeFile.Director;

/**
 * 
 */

/**
 * @author Administrator
 *
 */
public class test {
	public static void main(String[] args) {  
        //����Ŀ¼  
        String dirName = "F:/temp1";  
        Director.createDir(dirName);  
        //�����ļ�  
        String fileName = dirName + "/temp2/tempFile.txt";  
        Director.createFile(fileName);  
    }  
}
