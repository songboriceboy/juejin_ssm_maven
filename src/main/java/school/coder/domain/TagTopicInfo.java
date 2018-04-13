package school.coder.domain;

/**
 * Created by Administrator on 2018/4/13.
 */
public class TagTopicInfo {
    private int tag_topic_info_id;
    private int topic_id;
    private int tag_id;

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public int getTag_id() {
        return tag_id;
    }

    public void setTag_id(int tag_id) {
        this.tag_id = tag_id;
    }

    public int getTag_topic_info_id() {
        return tag_topic_info_id;
    }

    public void setTag_topic_info_id(int tag_topic_info_id) {
        this.tag_topic_info_id = tag_topic_info_id;
    }
}
