package school.coder.domain;

import java.util.Date;

/**
 * Created by Administrator on 2018/2/19.
 */
public class TopicCommentInfo {
    private int comment_id;
    private String comment_content;
    private String comment_markdown_content;
    private Date comment_createtime;
    private int topic_id;
    private int reply_comment_id;
    private int user_id;

    @Override
    public String toString() {
        return "TopicCommentInfo{" +
                "comment_id=" + comment_id +
                ", comment_content='" + comment_content + '\'' +
                ", comment_markdown_content='" + comment_markdown_content + '\'' +
                ", comment_createtime=" + comment_createtime +
                ", topic_id=" + topic_id +
                ", reply_comment_id=" + reply_comment_id +
                ", user_id=" + user_id +
                '}';
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getComment_markdown_content() {
        return comment_markdown_content;
    }

    public void setComment_markdown_content(String comment_markdown_content) {
        this.comment_markdown_content = comment_markdown_content;
    }

    public Date getComment_createtime() {
        return comment_createtime;
    }

    public void setComment_createtime(Date comment_createtime) {
        this.comment_createtime = comment_createtime;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public int getReply_comment_id() {
        return reply_comment_id;
    }

    public void setReply_comment_id(int reply_comment_id) {
        this.reply_comment_id = reply_comment_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
