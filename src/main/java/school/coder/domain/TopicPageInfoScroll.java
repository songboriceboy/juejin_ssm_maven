package school.coder.domain;

/**
 * Created by ttc on 2018/3/5.
 */
public class TopicPageInfoScroll {
    private int section_id;
    private int last_topic_id;
    private String tag_name;

    public String getTag_name() {
        return tag_name;
    }

    public void setTag_name(String tag_name) {
        this.tag_name = tag_name;
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
