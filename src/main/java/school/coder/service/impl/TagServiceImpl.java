package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TagInfoEx;
import school.coder.domain.TagSearchInfo;
import school.coder.domain.TagTopicInfo;
import school.coder.domain.TagUserInfo;
import school.coder.mapper.TagMapper;
import school.coder.service.TagServcie;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
@Service
public class TagServiceImpl implements TagServcie {
    @Autowired
    TagMapper tagMapper;
    @Override
    public List<TagInfoEx> getAllTags(TagSearchInfo tagSearchInfo) {
        return tagMapper.getAllTags(tagSearchInfo);
    }

    @Override
    public int insertTopicTagInfo(TagTopicInfo tagTopicInfo) {
        return tagMapper.insertTopicTagInfo(tagTopicInfo);
    }

    @Override
    public List<TagInfoEx> getTagsByUserID(int userid) {
        return tagMapper.getTagsByUserID(userid);
    }

    @Override
    public int followTag(TagUserInfo tagUserInfo) {
        return tagMapper.followTag(tagUserInfo);
    }

    @Override
    public int cancelFollowTag(TagUserInfo tagUserInfo) {
        return tagMapper.cancelFollowTag(tagUserInfo);
    }
}
