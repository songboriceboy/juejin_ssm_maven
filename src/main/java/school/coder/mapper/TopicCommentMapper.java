package school.coder.mapper;

import org.omg.CORBA.Object;
import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicCommentInfoEx;

import java.util.List;


/**
 * Created by Administrator on 2018/2/20.
 */
public interface TopicCommentMapper {
    int addComment(TopicCommentInfo topicCommentInfo);
    List<TopicCommentInfoEx> getAllCommentsByTopicID(int topic_id);
}
