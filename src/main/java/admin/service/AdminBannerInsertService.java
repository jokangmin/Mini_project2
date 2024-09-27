package admin.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imagebannerboard.bean.ImagebannerboardDTO;
import imagebannerboard.dao.ImagebannerboardDAO;
import imagebannerboard.service.NCPObjectStorageService;


public class AdminBannerInsertService implements CommandProcess {
	
	private String bucketName="bitcamp-9th-bucket-133";

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//실제 폴더
		//String realFolder = request.getServletContext().getRealPath("/storage");
		String realFolder = "D:\\AWS";
		System.out.println("realFolder = " + realFolder);
		
		//업로드
		/*
		MultipartRequest multi = new MultipartRequest(
				request,
				realFolder,
				5 * 1024 * 1024, //5MB
				"UTF-8");
		*/
		
		MultipartRequest multi = new MultipartRequest(
				request,
				realFolder, //이미지가 저장되는 위치
				5 * 1024 * 1024, //5MB
				"UTF-8",
				new DefaultFileRenamePolicy()); //똑같은 이름이 업로드되면 파일명을 변경해서 올린다.
		
		//데이터
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		String image1 = multi.getOriginalFileName("image1");
		String fileName = multi.getFilesystemName("image1");
		
		System.out.println(image1 + ", " + fileName);
		
		File file = new File(realFolder,image1);
		
		// Object Storage(NCP)에 새로운 이미지 올리기 
		
		System.out.println(image1 + ", " + fileName);
		
		NCPObjectStorageService ncp = new NCPObjectStorageService();
		
		image1 = ncp.uploadFile(bucketName, "storage/", file);
		
		ImagebannerboardDTO dto = new ImagebannerboardDTO();
		dto.setImageId(imageId);
		dto.setImageName(imageName);
		dto.setImagePrice(imagePrice);
		dto.setImageQty(imageQty);
		dto.setImageContent(imageContent);
		dto.setImage1(image1); //파일명만 DB에 저장
		
		ImagebannerboardDAO dao = ImagebannerboardDAO.getInstance();
		dao.imageboardWrite(dto);
		
		return "none";
	}
}
