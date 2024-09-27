package imagebannerboard.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class NCPObjectStorageService  {

	private String accessKey = "ncp_iam_BPASKR35jkYod2cFCvXc";
	private String secretKey = "ncp_iam_BPKSKRTgtAjh8sBRW0laSVh3rPr20kEKoY";
	private String regionName = "kr-standard";
	private String endPoint = "https://kr.object.ncloudstorage.com";
	
	final AmazonS3 s3;
	
	public NCPObjectStorageService() {
		s3 = AmazonS3ClientBuilder
				.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey,secretKey)))
				.build();
	}

	public String uploadFile(String bucketName, String directoryPath, File file) {
		//String fileName = file.getName();
		
		String fileName = UUID.randomUUID().toString();
		
		FileInputStream fileIn = null;	
		try {
			fileIn= new FileInputStream(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}//try
		
		ObjectMetadata objectMetadata =new ObjectMetadata();
		
		Path path = Paths.get(file.getAbsolutePath());
		
		String contentType =null;
		
		try {
			contentType = Files.probeContentType(path);
		} catch (IOException e) {
			e.printStackTrace();
		}//try
		
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(file.length());
		
		PutObjectRequest putobjectRequest =
				
				new PutObjectRequest(bucketName,
						directoryPath + fileName,
						fileIn,objectMetadata)
				.withCannedAcl(CannedAccessControlList.PublicRead); //접근권한
	  // 모든 사용자가 객체를 읽을수 있지만, 수정/삭제는 불가능
		
		s3.putObject(putobjectRequest);
		
		String image1 = fileName;
		
		return image1;
	}
	
	
}
