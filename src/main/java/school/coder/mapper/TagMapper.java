package school.coder.mapper;

import school.coder.domain.TagInfoEx;
import school.coder.domain.TagTopicInfo;
import school.coder.domain.TagUserInfo;
import school.coder.domain.TagSearchInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
public interface TagMapper {
    List<TagInfoEx> getAllTags(TagSearchInfo tagSearchInfo);
    int insertTopicTagInfo(TagTopicInfo tagTopicInfo);
    List<TagInfoEx> getTagsByUserID(int userid);
    int followTag(TagUserInfo tagUserInfo);
    int cancelFollowTag(TagUserInfo tagUserInfo);
}
