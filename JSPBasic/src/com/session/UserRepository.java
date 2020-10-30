package com.session;

import java.util.ArrayList;
import java.util.List;



public class UserRepository {
	
	//DB가정
	private static List<User> userList = new ArrayList<>();
	
	
	//user를 받아서 저장하는 매서드
		public static void setUser(User user) {
			userList.add(user);
		}


		public static User getUser(String id) {
			for(User user : userList) {
				if(user.getId().equals(id)) {
					return user;
				}
			}
			return null; // 없으면 null값 반환
			
		}

		// 회원탈퇴
		public static void delete (String id) {
			// 메서드 재사용 
			userList.remove( getUser(id));
			
		}

	
	
	

	
	
}
