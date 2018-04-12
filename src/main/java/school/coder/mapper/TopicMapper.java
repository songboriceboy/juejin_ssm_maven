package school.coder.mapper;

import school.coder.domain.TopicInfo;
import school.coder.domain.TopicInfoEx;
import school.coder.domain.TopicPageInfo;
import school.coder.domain.TopicPageInfoScroll;

import java.util.List;

/**
 * Created by Administrator on 2018/2/19.
 */
public interface TopicMapper {
    int insertTopic(TopicInfo topicInfo);
    int updateTopic(TopicInfo topicInfo);
    List<TopicInfoEx> getAllTopics();
    TopicInfo getTopicByID(int id);
    int getTopicsCounts(TopicPageInfo topicPageInfo);
    List<TopicInfoEx> getPagedTopics(TopicPageInfo topicPageInfo);
    List<TopicInfoEx> getPagedTopicsScroll(TopicPageInfoScroll topicPageInfoScroll);
}
