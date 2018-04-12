package school.coder.service.impl;

import org.omg.CORBA.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicCommentInfoEx;
import school.coder.mapper.TopicCommentMapper;
import school.coder.service.TopicCommentService;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/2/20.
 */
@Service
public class TopicCommentServiceImpl implements TopicCommentService {
    @Autowired
    TopicCommentMapper topicCommentMapper;
    @Override
    public int addComment(TopicCommentInfo topicCommentInfo) {
        return topicCommentMapper.addComment(topicCommentInfo);
    }

    @Override
    public List<TopicCommentInfoEx> getAllCommentsByTopicID(int topic_id) {
        return topicCommentMapper.getAllCommentsByTopicID(topic_id);
    }
}
