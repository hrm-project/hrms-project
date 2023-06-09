package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.page.BoardPage;
import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyModifyRequestDTO;
import com.hrms.project4th.mvc.entity.BoardReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BoardReplyMapper {

    List<BoardReply> findAll(long boardNo, BoardPage page);
    BoardReply findOne(long repNo);
    boolean save(BoardReply boardReply);
    boolean delete(BoardReply boardReply);

    int countReply(long boardNo);

    boolean modify(BoardReplyModifyRequestDTO dto);
}
