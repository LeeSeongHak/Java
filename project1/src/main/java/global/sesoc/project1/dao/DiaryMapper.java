package global.sesoc.project1.dao;

import java.util.ArrayList;

import global.sesoc.project1.vo.DiaryVO;

public interface DiaryMapper {

	//일기 작성
	public int insertDiary(DiaryVO diaryVO);
	//일기 목록
	public ArrayList<DiaryVO> getDiaryList();
	//일기 하나 읽기
	public DiaryVO readDiary(int num);
}
