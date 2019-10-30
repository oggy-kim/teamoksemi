package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

import member.model.vo.Member;


public class MyFileRenamePolicy implements FileRenamePolicy{

	public java.io.File rename(File mno) {
		
		String name = mno.getName();
		
		String ext = "";
		//member_no
		int dot = name.lastIndexOf(".");
		
		if(dot != -1) {
			ext = name.substring(dot);
		}
		
		String fileName = ".jpg";
		
		File newFile = new File(mno.getParent(), fileName);
		
		return newFile;
	}

	}

	
	
	
	
	

