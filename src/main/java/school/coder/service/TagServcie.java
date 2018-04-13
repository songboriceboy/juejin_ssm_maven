package school.coder.service;

import school.coder.domain.TagInfo;
import school.coder.domain.TagTopicInfo;
import school.coder.vo.TagInfoEx;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
public interface TagServcie {
    List<TagInfoEx> getAllTags(String search);
    int insertTopicTagInfo(TagTopicInfo tagTopicInfo);
}
