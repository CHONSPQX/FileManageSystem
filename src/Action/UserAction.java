/**
 * 
 */
package Action;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import User.User;
import WeFile.Director;

/**
 * @author Administrator
 *
 */
public class UserAction extends ActionSupport{
   private Database database;
   private User user;
   private String path;//���·��
   
   
   

public UserAction()
   {
     database =new Database();
     database.ConnectMysql();
   }
    
  public String UserCreate() {
    try {
        String insql = "insert into User(UserID,Password,Name,Sex,BirthDate,Message) values(?,?,?,?,?,?)";
        
        PreparedStatement ps = database.conn.prepareStatement(insql);
        
        ps.setString(1, user.getUserID());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getName());
        ps.setInt(4, user.getSex());
        ps.setDate(5, user.getBirthDate());
        ps.setString(6, user.getMessage());
        int result = ps.executeUpdate();
        if (result > 0)
        {
        	String dirName = user.getUserID() + "/";
        	System.out.println(dirName);
        	if(Director.createDir(dirName))
        		return "createok";
        	else return "createnotok";
        	
        }
        else
            return "createnotok";
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "createnotok";
}
  public String UserLogin() {
	  System.out.println(user.getUserID());
	  try{
        String insql = "select Password from User where UserID = ?";
        PreparedStatement ps = database.conn.prepareStatement(insql);
        ps.setString(1, user.getUserID());
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
        	if(rs.getString(1).equals(user.getPassword()))
        	{
        		ServletActionContext.getRequest().getSession().setAttribute("userID", user.getUserID());
        		return "loginok";
        	}
        		
        }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
        return "loginnotok";
}
  public String createDir()
  {
	  if(Director.createDir(path))
  		return "createDirok";
  	else return "createDirnotok";
  }
  
  
  public String UserCheckFile()
  {
	  System.out.print("1111");
	  String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
	  
	  ArrayList<String> all = Director.checkFile(id, "");
	  ServletActionContext.getRequest().setAttribute("AllFiles", all);
	  return "checkFileok";
  }
  /**
   * @return the user
   */
  public User getUser() {
    return user;
  }
  /**
   * @param user the user to set
   */
  public void setUser(User user) {
    this.user = user;
  }
  
 
  
  public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
     
}
