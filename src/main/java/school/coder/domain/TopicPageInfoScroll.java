package school.coder.domain;

/**
 * Created by ttc on 2018/3/5.
 */
public class TopicPageInfoScroll {
    private int section_id;
    private int last_topic_id;
    private int tag_id;

    public int getTag_id() {
        return tag_id;
    }

    public void setTag_id(int tag_id) {
        this.tag_id = tag_id;
    }

    public int getLast_topic_id() {
        return last_topic_id;
    }

    public void setLast_topic_id(int last_topic_id) {
        this.last_topic_id = last_topic_id;
    }

    public int getSection_id() {
        return section_id;
    }

    public void setSection_id(int section_id) {
        this.section_id = section_id;
    }
}
