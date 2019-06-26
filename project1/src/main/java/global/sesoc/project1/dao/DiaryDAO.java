package global.sesoc.project1.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project1.vo.DiaryVO;

@Repository
public class DiaryDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertDiary(DiaryVO diaryVO){
		
		int result = 0;
		
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		try {
			result = mapper.insertDiary(diaryVO);
		}
		catch (Exception e) {
				e.printStackTrace();
		}
		
		return result;
	}
	
	//다이어리 글 보여주기
	public ArrayList<DiaryVO> getDiaryList(){
		
		
		ArrayList<DiaryVO> diaryList = null;
		
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		try {
			diaryList = mapper.getDiaryList();
		}
		catch (Exception e) {
				e.printStackTrace();
		}
		
		
		return diaryList;
	}
	
	//글 하나 읽기
	public DiaryVO readDiary(int num){
		
		DiaryVO diary = null;
		
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		try {
			diary = mapper.readDiary(num);
		}
		catch (Exception e) {
				e.printStackTrace();
		}
		
		return diary;
	}
}
