package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TagInfo;
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
    public List<TagInfo> getAllTags() {
        return tagMapper.getAllTags();
    }
}
