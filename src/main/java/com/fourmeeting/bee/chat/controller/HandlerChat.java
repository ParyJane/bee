package com.fourmeeting.bee.chat.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class HandlerChat extends TextWebSocketHandler {

	// (<"beesNo", 방ID>, <"session", 세션>) - (<"beesNo", 방ID>, <"session", 세션>) - (<"beesNo", 방ID>, <"session", 세션>) 형태 
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);

		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		switch (mapReceive.get("cmd")) {
		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("beesNo", mapReceive.get("beesNo"));
			map.put("userName", mapReceive.get("userName"));
			map.put("session", session);
			sessionList.add(map);
			
			// 같은 채팅방에 입장 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String beesNo = (String) mapSessionList.get("beesNo");
				String userName = (String) mapSessionList.get("userName");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				if(beesNo.equals(mapReceive.get("beesNo"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("beesNo", beesNo);
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("msg", mapReceive.get("userName") +  "님이 입장 했습니다.");
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
			
		// CLIENT 메세지
		case "CMD_MSG_SEND":
			// 같은 채팅방에 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String beesNo = (String) mapSessionList.get("beesNo");
				String userName = (String) mapSessionList.get("userName");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (beesNo.equals(mapReceive.get("beesNo"))) {
					if(!(userName.equals(mapReceive.get("userName")))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("beesNo", beesNo);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", mapReceive.get("userName") + " : " + mapReceive.get("msg"));

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
					}
				}
			}
			break;
		}
	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
		ObjectMapper objectMapper = new ObjectMapper();
		String nowBeesNo = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String beesNo = (String) map.get("beesNo");
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				nowBeesNo = beesNo;
				sessionList.remove(map);
				break;
			}	
		}
		
		// 같은 채팅방에 퇴장 메세지 전송 
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String beesNo = (String) mapSessionList.get("beesNo");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			if (beesNo.equals(nowBeesNo)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("beesNo", beesNo);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", "님이 퇴장 했습니다.");

				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
	}
}

