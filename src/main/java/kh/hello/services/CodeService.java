package kh.hello.services;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import kh.hello.dao.CodeDAO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;

@Service
public class CodeService {
	@Autowired
	private CodeDAO dao;
	
	//질문 CodeQuestion
	public List<CodeQuestionDTO> selectQuestionAll() throws Exception{
			return dao.selectQuestionAll();
	}
	
	public void insert(CodeQuestionDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	public void imageUpload(CodeQuestionDTO dto,String path) throws Exception{
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(dto.getContent());

		String oriName = null;
		String sysName = null;
		while(m.find()) { 
			oriName = m.group(2); 
			if(oriName.equals("")) { 
				break;
			}
			else {
				sysName = System.currentTimeMillis() + "_" + oriName;
				String imageString = m.group(1).split(",")[1];
				byte[] imgByte = Base64Utils.decodeFromString(imageString); 
				FileOutputStream fos = new FileOutputStream(path + "/" + sysName);
				DataOutputStream dos = new DataOutputStream(fos);
				dos.write(imgByte);
				dos.flush();
				dos.close();
				String contents = dto.getContent().replaceFirst(Pattern.quote(m.group(1)), "/files/"+sysName);
			}
		}
	}
	
	@Transactional("txManager")
	public CodeQuestionDTO detailQuestion(int seq) throws Exception{
		dao.incrementViewCount(seq);
		return dao.detailQuestion(seq);
	}
	
	public void delete(int seq) throws Exception{
		dao.delete(seq);
	}
	
	//답글 CodeReply
//	public int selectParentSeq(int seq) throws Exception{
//		return dao.selectParentSeq(seq);
//	}
	
	public void insertR(CodeReplyDTO dto) throws Exception{
		dao.insertR(dto);
	}
	
	public List<CodeReplyDTO> selectReplyAll() throws Exception{
		return dao.selectReplyAll();
	}
	
	public void imageUploadR(CodeReplyDTO dto,String path) throws Exception{
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(dto.getContent());

		String oriName = null;
		String sysName = null;
		while(m.find()) { 
			oriName = m.group(2); 
			if(oriName.equals("")) { 
				break;
			}
			else {
				sysName = System.currentTimeMillis() + "_" + oriName;
				String imageString = m.group(1).split(",")[1];
				byte[] imgByte = Base64Utils.decodeFromString(imageString); 
				FileOutputStream fos = new FileOutputStream(path + "/" + sysName);
				DataOutputStream dos = new DataOutputStream(fos);
				dos.write(imgByte);
				dos.flush();
				dos.close();
				String contents = dto.getContent().replaceFirst(Pattern.quote(m.group(1)), "/files/"+sysName);
			}
		}
	}
	
	public void deleteR(int seq) throws Exception{
		dao.delete(seq);
	}
	
	public List<CodeReplyDTO> detailReply(int seq) throws Exception{
		return dao.detailReply(seq);
	}
	
	
	//CodeCommentsDAO
}
