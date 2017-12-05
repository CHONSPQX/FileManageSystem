package Action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import User.User;
import WeFile.Director;

/**
 * @author Administrator
 *
 */
public class UserAction extends ActionSupport {
	private Database database;
	private User user;
	private String path;//
	private String SharedFilePath;// 用户现在查看的分享文件的绝对路径
	private CommentDatabase conn;
	private String context;// 用户评论的内容
	private String confirmword;

	public String getSharedFilePath() {
		return SharedFilePath;
	}

	public void setSharedFilePath(String sharedFilePath) {
		SharedFilePath = sharedFilePath;
	}

	public UserAction() {
		database = new Database();
		database.ConnectMysql();
		conn = new CommentDatabase();
		conn.ConnectMysql();
	}

	public String UserComment() {
		try {
			String userid = "admin3";
			String mysql = "INSERT INTO shared(userID,context,time) VALUES(?,?,?);";
			PreparedStatement ps = conn.conn.prepareStatement(mysql);
			ps.setString(1, userid);
			ps.setString(2, "感觉这篇文章写的很好");
			ps.setTimestamp(3, new Timestamp(new Date().getTime()));
			int result = ps.executeUpdate();
			if (result > 0) {
				return "comment_success";
			} else
				return "comment_failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "comment_failed";
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String UserCreate() {
		if (confirmword.equals(user.getPassword()))
			try {
				String insql = "insert into User(UserID,Password,Name,Sex,BirthDate,Message,UserEmail) values(?,?,?,?,?,?,?)";
				PreparedStatement ps = database.conn.prepareStatement(insql);
				ps.setString(1, user.getUserID());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getName());
				ps.setInt(4, user.getSex());
				ps.setDate(5, user.getBirthDate());
				ps.setString(6, user.getMessage());
				ps.setString(7, user.getUserEmail());
				System.out.println(user.getUserEmail());
				int result = ps.executeUpdate();
				if (result > 0) {
					String dirName = user.getUserID() + "/";
					System.out.println(dirName);
					if (Director.createDir(dirName)) {
						FullTextRetrieval.CreateIndex(user.getUserID());
						return "create_user_success";
					} else {
						return "create_user_failed";
					}

				} else
					return "create_user_success";
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "create_user_failed";
	}

	public String UserLogout() {
		if ((String) ServletActionContext.getRequest().getSession().getAttribute("userID") == null)
			return "logout_failed";
		ServletActionContext.getRequest().getSession().removeAttribute("userID");
		return "logout_success";
	}

	public String UserLogin() {
		try {
			String regEx1 = "([\\w\\-\\.]+)@([0-9a-zA-Z\\-]+)(\\.[a-zA-Z]{2,4}){1,2}";
			Pattern p1 = Pattern.compile(regEx1);
			Matcher m1 = p1.matcher(user.getUserID());
			boolean b = m1.matches();
			System.out.print(b);
			System.out.println(b);
			String insql;
			if (!b) {
				insql = "select Password from User where UserID = ?";
			} else {
				insql = "select Password from User where UserEmail = ?";
			}
			PreparedStatement ps = database.conn.prepareStatement(insql);
			ps.setString(1, user.getUserID());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(user.getPassword())) {
					if (!b)
						ServletActionContext.getRequest().getSession().setAttribute("userID", user.getUserID());
					else
						ServletActionContext.getRequest().getSession().setAttribute("userEmail", user.getUserID());
					return "login_success";
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login_failed";
	}

	public String createDir() {
		if (Director.createDir(path))
			return "createDirok";
		else
			return "createDirnotok";
	}

	public String UserCheckFile() {
		String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		ArrayList<String> all = Director.checkFile(id, "");
		for (String s : all)
			System.out.println(s);
		ServletActionContext.getRequest().setAttribute("AllFiles", all);
		return "check_file_success";
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
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

	/**
	 * @return the confirmword
	 */
	public String getConfirmword() {
		return confirmword;
	}

	/**
	 * @param confirmword
	 *            the confirmword to set
	 */
	public void setConfirmword(String confirmword) {
		this.confirmword = confirmword;
	}

}
