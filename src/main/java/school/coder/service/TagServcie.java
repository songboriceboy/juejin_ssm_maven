package school.coder.service;

import school.coder.domain.TagInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/4/12.
 */
public interface TagServcie {
    List<TagInfo> getAllTags(String search);
}
