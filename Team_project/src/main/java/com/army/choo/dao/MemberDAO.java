package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.dto.PageDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int comMemberInsertForm(ComMemberDTO mDTO) {
		return sql.insert("Member.ComMemberInsert", mDTO);
	}

	//전체 지점수
	public int listcount() {
		return sql.selectOne("Member.commembercount");
	}

	//시작 행과 끝 행을 가지고 지점 수 가져오기
	public List<PageDTO> commemberListpaging(PageDTO pdto) {
		return sql.selectList("Member.commemberlist",pdto);
	}

	//기업 로그인
	public String comLoginForm(ComMemberDTO mDTO) {
		return sql.selectOne("Member.ComLoginForm", mDTO);
	}
	
	//일반회원 회원가입
	public int memberinsert(MemberDTO member) {
		return sql.insert("Member.memberInsert", member);
	}

	//아이디 중복체크
	public String idOverlap(String mid) {
		return sql.selectOne("Member.idOverlap",mid);
	}

	//일반회원 로그인
	public String memberlogin(MemberDTO member) {
		return sql.selectOne("Member.memberLogin",member);
	}
}
