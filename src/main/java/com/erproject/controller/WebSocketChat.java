package com.erproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/echo/{bno}")
public class WebSocketChat {
    
    private static final List<Session> sessionList= new ArrayList<Session>();
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    private static final List<String> bnoList2 = new ArrayList<String>();
  
    public WebSocketChat() {
    	
        System.out.println("웹소켓 생성");
        
    }
    
    @OnOpen
    public void onOpen(Session session, @PathParam("bno") String bno) {
    	
    	System.out.println("삐에노"+bno);
    	
        logger.info("Open session id:"+session.getId());

        try {
        	
            final Basic basic=session.getBasicRemote();
            
            basic.sendText("-대화방에 참여했습니다-");
            
        }catch (Exception e) {
        	
            System.out.println(e.getMessage());
            
        }
        
        bnoList2.add(bno);
        sessionList.add(session);
        
    }
    
    private void sendAllSessionToMessage(Session self, String sender, String message, String bno) {
    	
    	System.out.println("jsp비에노: " + bno);
    	System.out.println("삐에노리스트"+bnoList2.toString());
    	System.out.println("쎼숀리스트"+sessionList.toString());
    	
        try {
        	   	 
        	
        	for(int i = 0; i<sessionList.size(); i ++) {
        		 		
        		if(bnoList2.get(i).equals(bno)) {
        			
        			System.out.println("bnoList2: "+ bnoList2.get(i));
        			
        			Session session = sessionList.get(i);
        			System.out.println("session: "+ session.getId());
        			
        			if(!self.getId().equals(session.getId())) {
        				
        				
        				session.getBasicRemote().sendText(sender+" : "+message);
        				
        				
        			}

        		}
        		
            	
        	}
        	
        	
        }catch (Exception e) {

            System.out.println(e.getMessage());
            
        }
    }
    
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String bno = message.split(",")[2];
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
    	
        logger.info("Message From "+sender + ": "+message);
        try {
        	
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
            
        }catch (Exception e) {
           
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message, bno);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
    	
        logger.info("Session "+session.getId()+" has ended");
        
        for(int i =0; i<sessionList.size(); i++) {
        	
        	if(sessionList.get(i).equals(session)) {
        		bnoList2.remove(i);
        	}
        	
        }
        
        sessionList.remove(session);
       
        

    }
}
