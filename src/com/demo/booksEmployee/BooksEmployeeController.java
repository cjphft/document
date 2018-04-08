package com.demo.booksEmployee;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.demo.util.XMLParseUtil;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

public class BooksEmployeeController extends Controller {
	public void index(){
		
	}
	//鏂板鍛樺伐
	@Clear
	public void add() throws Exception{
		//String xml = getPara("createUsers");
		String xml="<users><user><uid>992431</uid><realName>鏇归挗</realName><idCardNumber>31010119600823121X</idCardNumber><idCardStartTime>2005-12-10</idCardStartTime><idCardEndTime>2025-12-10</idCardEndTime></user><user><uid>992434</uid><realName>閲戜匠瀵�/realName><idCardNumber>310110198610072050</idCardNumber><idCardStartTime>2006-06-26</idCardStartTime><idCardEndTime>2016-06-26</idCardEndTime></user></users>";
		//瑙ｆ瀽鎶ユ枃
		List list = XMLParseUtil.parseNodename(xml, "uid");
		StringBuffer sendList = new StringBuffer();
		sendList.append("<results>");
		for(int i=0; i<list.size(); i++){
			Map map = (Map) list.get(i);
			Iterator<Map.Entry<String, String>> entries = map.entrySet().iterator(); 
			sendList.append("<user>");
			//灏唘id鍊煎瓨鍏ユ暟鎹簱
			while (entries.hasNext()) {  
				Map.Entry<String, String> entry = entries.next();   
				String employeeId = entry.getValue();
				sendList.append("<uid>");
				sendList.append(employeeId);
				sendList.append("</uid>");				
				//鍏堝垽鏂槸鍚︽槸鏂板鐢ㄦ埛
				if(BooksEmployee.me.findOne(employeeId) == null){
					BooksEmployee booksEmployee = getModel(BooksEmployee.class);
					booksEmployee.set("employeeId",entry.getValue());
				    booksEmployee.save();
				    sendList.append("<code>");
					sendList.append("101");  //鐢ㄦ埛鍒涘缓鎴愬姛
					sendList.append("</code>");
					sendList.append("<msg>");
					sendList.append("鐢ㄦ埛鍒涘缓鎴愬姛");
					sendList.append("</msg>");
				}
				else{
					sendList.append("<code>");
					sendList.append("105");   //鐢ㄦ埛宸插瓨鍦�
					sendList.append("</code>");
					sendList.append("<msg>");
					sendList.append("鐢ㄦ埛宸插瓨鍦�");
					sendList.append("</msg>");
				}
				
			}
			sendList.append("</user>");
		}
		sendList.append("</results>");
		System.out.println(sendList.toString());
		renderText(sendList.toString());		
	}
	
	//鍐荤粨鍛樺伐
	@Clear
	public void freeze() throws Exception{
		//String xml = getPara("freezeUsers");
		String xml="<users><user><uid>992431</uid><realName>鏇归挗</realName><idCardNumber>31010119600823121X</idCardNumber><idCardStartTime>2005-12-10</idCardStartTime><idCardEndTime>2025-12-10</idCardEndTime></user><user><uid>992434</uid><realName>閲戜匠瀵�/realName><idCardNumber>310110198610072050</idCardNumber><idCardStartTime>2006-06-26</idCardStartTime><idCardEndTime>2016-06-26</idCardEndTime></user></users>";
		//瑙ｆ瀽鎶ユ枃
	    List list = XMLParseUtil.parseNodename(xml, "uid");
		StringBuffer sendList = new StringBuffer();
		sendList.append("<results>");
		for(int i=0; i<list.size(); i++){
			Map map = (Map) list.get(i);
			Iterator<Map.Entry<String, String>> entries = map.entrySet().iterator(); 
			sendList.append("<user>");
			//灏唘id鍊煎瓨鍏ユ暟鎹簱
			while (entries.hasNext()) {  
				Map.Entry<String, String> entry = entries.next();   
				String employeeId = entry.getValue();
				sendList.append("<uid>");
				sendList.append(employeeId);
				sendList.append("</uid>");	
				BooksEmployee booksEmployee = BooksEmployee.me.findOne(employeeId);
				//鍏堝垽鏂槸鍚︽槸鏂板鐢ㄦ埛
				if(booksEmployee != null){
					booksEmployee.set("status", "1");					
					booksEmployee.update();
					sendList.append("<code>");
					sendList.append("103");  //鐢ㄦ埛鍐荤粨鎴愬姛
					sendList.append("</code>");
					sendList.append("<msg>");
					sendList.append("鐢ㄦ埛鍐荤粨鎴愬姛");
					sendList.append("</msg>");
					}
				else{
					sendList.append("<code>");
					sendList.append("100");   //鐢ㄦ埛涓嶅瓨鍦�
					sendList.append("</code>");
					sendList.append("<msg>");
					sendList.append("鐢ㄦ埛涓嶅瓨鍦�");
					sendList.append("</msg>");
					}
						
				}
				sendList.append("</user>");
			}
			sendList.append("</results>");
			System.out.println(sendList.toString());
			renderText(sendList.toString());		
	}
}
