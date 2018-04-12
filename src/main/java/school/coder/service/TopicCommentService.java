package school.coder.service;

import org.omg.CORBA.Object;
import org.springframework.stereotype.Service;
import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicCommentInfoEx;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/2/20.
 */

public interface TopicCommentService {
    int addComment(TopicCommentInfo topicCommentInfo);
    List<TopicCommentInfoEx> getAllCommentsByTopicID(int topic_id);
}
