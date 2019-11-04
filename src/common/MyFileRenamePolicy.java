package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

import member.model.vo.Member;


public class MyFileRenamePolicy implements FileRenamePolicy{
	

	private int mno;


	public MyFileRenamePolicy(int mno) {
		// TODO Auto-generated constructor stub
	}

	public java.io.File rename(File mno) {
		
/*		String name = mno.getName();
		
		String ext = "";
		
		int dot = name.lastIndexOf(".");
		
		if(dot != -1) {
			ext = name.substring(dot);
		}
		String fileName = mno + ext;*/
		
		String fileName = mno + ".jpg";
		
		File newFile = new File(mno, fileName);
//		.getParent()	
		return newFile;
	}

	}

	
	
	
	
	

