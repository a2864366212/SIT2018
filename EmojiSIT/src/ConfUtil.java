import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfUtil {
	public String getConfig(String propFilePath, String key) {
		String res=null;
		String propertiesPath=this.getClass().getResource(propFilePath).getPath();
		InputStream in=null;
		try {
			in = new BufferedInputStream(new FileInputStream(propertiesPath));
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 Properties prop = new Properties();
		 try {
			prop.load(in);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		res=prop.getProperty(key);
		
		return res;
	}
}
