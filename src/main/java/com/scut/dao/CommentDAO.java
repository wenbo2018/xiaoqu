package com.scut.dao;
import org.springframework.stereotype.Repository;

import com.scut.model.Comment;
@Repository("commentDao")
public class CommentDAO extends BaseDAO<Comment> implements ICommentDAO{

}
