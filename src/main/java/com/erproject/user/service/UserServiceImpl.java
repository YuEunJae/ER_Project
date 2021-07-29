package com.erproject.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erproject.command.UserVO;
import com.erproject.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int join(UserVO vo) {
		
		return userMapper.join(vo);
	}

	@Override
	public int idCheck(UserVO vo) {
		
		return userMapper.idCheck(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		
		return userMapper.login(vo);
	}

	@Override
	public UserVO getInfo(String userId) {
		
		return userMapper.getInfo(userId);
	}

	@Override
	public int update(UserVO vo) {
	
		return userMapper.update(vo);
	}

	@Override
	public int delete(UserVO vo) {
		
		return userMapper.delete(vo);
	}


	@Override
	public int kakaojoin(String id , String email) {
		
		UserVO vo = new UserVO();
		vo.setUserId(id);
		vo.setUserEmail(email);
		
		return userMapper.kakaojoin(vo);
	}

	@Override
	public int kakaoCheck(String email) {
		
		return userMapper.kakaoCheck(email);
	}

	@Override
	public int forgotck(UserVO vo) {
		
		return userMapper.forgotck(vo);
	}

	@Override
	public int pwUpdate(UserVO vo) {
		
		return userMapper.pwUpdate(vo);
	}

	@Override
	public int qnaDelete(String[] bno) {
		
		for(int i =0; i <bno.length; i++) {
		
			
			int result = userMapper.qnaDelete(bno[i]);
			if(result==0) {
				return result;
			} else {
				
				userMapper.qnaReDelete(bno[i]);
			}
			
		}
		
		
		return 1;
	}

	@Override
	public UserVO getInfo2(String userId) {
		
		return userMapper.getInfo2(userId);
	}

	@Override
	public int rnoDelete(String[] rno) {
		
		for(int i=0; i <rno.length; i++) {
			int result = userMapper.rnoDelete(rno[i]);
			
			if(result==0) {
				
				return result;
			} 
		}
		
		
		return 1;
	}

	@Override
	public int rentalNum() {
		// TODO Auto-generated method stub
		return userMapper.rentalNum();
	}

	
	
	



}
