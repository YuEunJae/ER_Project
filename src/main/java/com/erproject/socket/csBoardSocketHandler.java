package com.erproject.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.erproject.command.UserVO;

public class csBoardSocketHandler extends TextWebSocketHandler{
	
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	// 커넥션이 연결 되었을 때 ( 클라이언트가 접속이 될 때마다 실행 )
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("afterConnectionEstablished : " + session);
		
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}

	// 소켓에 메시지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("chatMsg : " + message.getPayload() );
		
		String msg = message.getPayload();
		
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = message.getPayload().split(",");
			
			if(strs != null && strs.length == 3) {
				String userId = strs[0];
				String sendId = strs[1];
				String realMsg = strs[2];
				
				WebSocketSession sendSession = userSessions.get(sendId);
				if(sendSession != null) {
					sendSession.sendMessage(new TextMessage("<span>" + userId + "</span>" + " : " + realMsg));
				}
			}
		}
	}

	// 커넥션이 닫혔을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		System.out.println("afterConnectionClosed : " + status);
	}

	// 로그인된 사용자 ID 얻기
	private String getId(WebSocketSession session) {
		
		Map<String, Object> map = session.getAttributes();
		
		UserVO user = (UserVO)map.get("userVO");
		String userId = user.getUserId();
		System.out.println(userId);
		
		return userId;
	}
	
	
}
