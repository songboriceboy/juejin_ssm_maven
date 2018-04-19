package school.coder.mapper;

import school.coder.domain.TagTopicInfo;
import school.coder.domain.TagInfoEx;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
public interface TagMapper {
    List<TagInfoEx> getAllTags(String search);
    int insertTopicTagInfo(TagTopicInfo tagTopicInfo);
    List<TagInfoEx> getTagsByUserID(int userid);
}
