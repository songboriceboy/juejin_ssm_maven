package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TopicInfo;
import school.coder.domain.TopicInfoEx;
import school.coder.domain.TopicPageInfo;
import school.coder.domain.TopicPageInfoScroll;
import school.coder.mapper.TopicMapper;
import school.coder.service.TopicService;

import java.util.List;

/**
 * Created by Administrator on 2018/2/19.
 */
@Service
public class TopicServiceImpl implements TopicService {
    @Autowired
    private TopicMapper topicMapper;
    @Override
    public int insertTopic(TopicInfo topicInfo) {
        return topicMapper.insertTopic(topicInfo);
    }

    @Override
    public int updateTopic(TopicInfo topicInfo) {
        return topicMapper.updateTopic(topicInfo);
    }

    @Override
    public List<TopicInfoEx> getAllTopics() {
        return topicMapper.getAllTopics();
    }

    @Override
    public TopicInfo getTopicByID(int id) {
        return topicMapper.getTopicByID(id);
    }

    @Override
    public int getTopicsCounts(TopicPageInfo topicPageInfo) {
        return topicMapper.getTopicsCounts(topicPageInfo);
    }

    @Override
    public List<TopicInfoEx> getPagedTopics(TopicPageInfo topicPageInfo) {
        return topicMapper.getPagedTopics(topicPageInfo);
    }

    @Override
    public List<TopicInfoEx> getPagedTopics(TopicPageInfoScroll topicPageInfoScroll) {
        return topicMapper.getPagedTopicsScroll(topicPageInfoScroll);
    }
}
