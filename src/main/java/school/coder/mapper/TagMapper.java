package school.coder.mapper;

import school.coder.domain.TagInfo;
import school.coder.domain.TagTopicInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
public interface TagMapper {
    List<TagInfo> getAllTags(String search);
    int insertTopicTagInfo(TagTopicInfo tagTopicInfo);
}
