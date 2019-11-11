package common;

import java.io.File;

public class FileRenamePolicy implements com.oreilly.servlet.multipart.FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		File newFile = new File(originFile.getPath());
		return newFile;
	}

}
