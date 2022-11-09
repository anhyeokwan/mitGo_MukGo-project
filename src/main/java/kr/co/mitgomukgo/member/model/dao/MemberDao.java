package kr.co.mitgomukgo.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.vo.Reserve;
import kr.co.mitgomukgo.store.model.vo.Store;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String checkId(String checkId) {
		String memberId = sqlSession.selectOne("member.checkId",checkId);
		return memberId;
	}

	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}

	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		return m;
	}

	public int insertOwner(Owner o) {
		int result = sqlSession.insert("owner.insertOwner",o);
		return result;
	}

	public String ownerCheckId(String ownerCheckId) {
		String ownerId = sqlSession.selectOne("owner.ownerCheckId", ownerCheckId);
		return ownerId;
	}

	public Owner selectOneOwner(Owner owner) {
		Owner o = sqlSession.selectOne("owner.selectOneOwner", owner);
		return o;
	}

	public Store searchStore(int ownerNo) {
		Store s = sqlSession.selectOne("store.searchStore", ownerNo);
		return s;
	}

	public int updateOwner(Owner o) {
		int result = sqlSession.update("owner.updateOwner", o);
		return result;
	}

	public int updateMember(Member m) {
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}

	public ArrayList<Reserve> selectReserveList(Member m) {
		List rs = sqlSession.selectList("reserve.selectReserveList",m);
		return (ArrayList<Reserve>)rs;
	}

	public ArrayList<Reserve> selectAllReserve(int storeNo) {
		List list = sqlSession.selectList("reserve.selectAllReserve", storeNo);
		return (ArrayList<Reserve>) list;
	}

	public int cancleReserve(int reserveNo) {
		return sqlSession.delete("cancleReserve", reserveNo);
	}

	
}
