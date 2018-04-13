package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TagTopicInfo;
import school.coder.mapper.TagMapper;
import school.coder.service.TagServcie;
import school.coder.domain.TagInfoEx;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
@Service
public class TagServiceImpl implements TagServcie {
    @Autowired
    TagMapper tagMapper;
    @Override
    public List<TagInfoEx> getAllTags(String search) {
        return tagMapper.getAllTags(search);
    }

    @Override
    public int insertTopicTagInfo(TagTopicInfo tagTopicInfo) {
        return tagMapper.insertTopicTagInfo(tagTopicInfo);
    }
}
