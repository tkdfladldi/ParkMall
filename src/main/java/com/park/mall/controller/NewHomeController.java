package com.park.mall.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.park.mall.dao.NewDAO;
import com.park.mall.model.SleepVO;

@Controller
public class NewHomeController {
	@Autowired
	NewDAO nDAO;
	
	@ResponseBody
	@RequestMapping(value = "/newhome/Cancel", method = RequestMethod.POST)
	public int Cancel(HttpServletRequest req) {
		
		int num = nDAO.sleepDelete(req);
		if(num > 0) {
			try {
			String cmd = "shutdown -a";
			Process process = Runtime.getRuntime().exec("cmd /c " + cmd);
			BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line = null;
			StringBuffer sb = new StringBuffer();
			sb.append(cmd);
			while ((line = reader.readLine()) != null) {
				sb.append(line);
				sb.append("\n <br>");
			}
			String result = sb.toString();

			System.out.println(result);
			 
			return 1;	
			}
			catch (Exception e) {
				System.out.println(e);
				return 0;
			}
		}else {
			return 0;
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/newhome/sleepChk", method = RequestMethod.POST)
	public long sleepChk(HttpServletRequest req) {

		SleepVO sleepVO = nDAO.selectSleep(req);
		
		if(sleepVO == null) {
			return 0;
		}else {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
			 Date now = new Date();
			 String nowTime2 = sdf1.format(now);
			 Long str = Long.parseLong(nowTime2);
			if(sleepVO.getSleep() < str) {
				int resultNum = nDAO.sleepDelete(req);
				return 0;
			}
			return sleepVO.getSleep();
		}

	}

	@RequestMapping(value = "/newhome", method = RequestMethod.GET)
	public String newHome(HttpServletRequest req) {

		req.setAttribute("content", "main.jsp");
		
		return "/new/home";
	}
	@RequestMapping(value = "/newChatRoom", method = RequestMethod.GET)
	public String newChatRoom(HttpServletRequest req) {

		
		return "/new/newChatRoom";
	}

	@RequestMapping(value = "/newhome/sleep", method = RequestMethod.GET)
	public String sleep(HttpServletRequest req) {

		req.setAttribute("content", "sleep.jsp");

		return "/new/home";
	}

	@ResponseBody
	@RequestMapping(value = "/newhome/ipChk", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String ipChk(HttpServletRequest req) throws InterruptedException, IOException {

		String cmd = "ipconfig";

		// cmd 는 cmd 를 실행하라는 뜻이며 , /c 는 명령어 처리가 끝나면 cmd 를 종료하라는 뜻이다 만약 /c 를넣지 않으면 cmd 가
		// 종료되지 않으므로 결과를 얻을 수가 없다.
		Process process = Runtime.getRuntime().exec("cmd /c " + cmd);
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = null;
		StringBuffer sb = new StringBuffer();
		sb.append(cmd);
		while ((line = reader.readLine()) != null) {
			sb.append(line);
			sb.append("\n <br>");
		}
		String result = sb.toString();

		System.out.println(result);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/newhome/sleepPost", method = RequestMethod.POST)
	public long sleepPost(HttpServletRequest req) {
		int hour = Integer.parseInt(req.getParameter("hour"));
		int minute = Integer.parseInt(req.getParameter("minute"));

		SleepVO sleepVO = nDAO.selectSleep(req);

		if (sleepVO == null) {
			if (hour == 0 && minute == 0) {
				return 0;
			} else {
				
				int calTime = timeCal(hour, minute);
				try {
					Process process = Runtime.getRuntime().exec("cmd /c shutdown -f -s -t " + calTime);
					BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
					String line = null;
					StringBuffer sb = new StringBuffer();
					sb.append("컴퓨터 강제 종료 \n");
					while ((line = reader.readLine()) != null) {
						sb.append(line);
						sb.append("\n");
					}
					String result = sb.toString();

					System.out.println(result);
					
					String dbtimeCal = dbtimeCal(hour , minute);
					
					long dbNum = Long.parseLong(dbtimeCal);
					
					int resultNum = nDAO.insertSleep(req,dbNum);
					
					return dbNum;

				} catch (Exception e) {
					System.out.println("에러  :" + e);
					return 0;
				}

			}
		} else {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
			 Date now = new Date();
			 String nowTime2 = sdf1.format(now);
			 Long str = Long.parseLong(nowTime2);
			if(sleepVO.getSleep() < str) {
				int resultNum = nDAO.sleepDelete(req);
			}
			return 0;
		}

	}

	public int timeCal(int hour, int minute) {
		int hour1 = 3600;
		int minute1 = 60;
		int cal = 0;

		for (int i = 0; i < hour; i++) {
			cal += hour1;
		}
		for (int i = 0; i < minute; i++) {
			cal += minute1;
		}
		return cal;
	}

	public String dbtimeCal(int hour, int minute) {

	
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
		
		 Date date = new Date();
		
		 Calendar cal = Calendar.getInstance();
		 
		 cal.setTime(date);
		 
		 cal.add(Calendar.HOUR, hour);
		 
		 cal.add(Calendar.MINUTE, minute);
		 
		 String today = sdf1.format(cal.getTime());
		 
		return today;

	}

}
