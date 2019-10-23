package egovframework.example.cmmn;

import java.io.File;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUpload {
	
	public String[] fileUpload(MultipartFile[] file, MultipartHttpServletRequest muti) {
		
		String root = muti.getSession().getServletContext().getRealPath("/");
		String path = root + "upload\\";
		File dir = new File(path);
		int count = 0;
		String saveFile;
		
		for (int i = 0; i < file.length; i++) {

			if (!file[i].isEmpty()) {
				count++;
			}
		}

		String[] fileName = new String[count];

		if (!dir.isDirectory()) {
			System.out.println("폴더생성");
			dir.mkdirs();
		}

		try {
			for (int i = 0; i < count; i++) {
				fileName[i] = file[i].getOriginalFilename();
				saveFile = path + fileName[i];
				file[i].transferTo(new File(saveFile));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return fileName;
	}
}
