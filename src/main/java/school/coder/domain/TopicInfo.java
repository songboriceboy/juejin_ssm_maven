package school.coder.domain;

import java.util.Date;

/**
 * Created by Administrator on 2018/2/19.
 */

public class TopicInfo {
    private int topic_id;
    private String topic_title;
    private String topic_content;
    private String topic_markdown_content;
    private Date topic_createtime;
    private int section_id;
    private int user_id;

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public String getTopic_title() {
        return topic_title;
    }

    public void setTopic_title(String topic_title) {
        this.topic_title = topic_title;
    }

    public String getTopic_content() {
        return topic_content;
    }

    public void setTopic_content(String topic_content) {
        this.topic_content = topic_content;
    }

    public Date getTopic_createtime() {
        return topic_createtime;
    }

    public void setTopic_createtime(Date topic_createtime) {
        this.topic_createtime = topic_createtime;
    }

    public int getSection_id() {
        return section_id;
    }

    public void setSection_id(int section_id) {
        this.section_id = section_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public String getTopic_markdown_content() {
        return topic_markdown_content;
    }

    public void setTopic_markdown_content(String topic_markdown_content) {
        this.topic_markdown_content = topic_markdown_content;
    }

    @Override
    public String toString() {
        return "TopicInfo{" +
                "topic_id=" + topic_id +
                ", topic_title='" + topic_title + '\'' +
                ", topic_content='" + topic_content + '\'' +
                ", topic_markdown_content='" + topic_markdown_content + '\'' +
                ", topic_createtime=" + topic_createtime +
                ", section_id=" + section_id +
                ", user_id=" + user_id +
                '}';
    }
}
