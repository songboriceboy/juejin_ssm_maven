package school.coder.domain;

/**
 * Created by Administrator on 2018/2/21.
 */
public class TopicInfoEx extends TopicInfo {
    private String user_name;
    private String user_avatar;
    private String section_name;
    private int comment_count;
    private String createtime_str;

    public String getCreatetime_str() {
        return createtime_str;
    }

    public void setCreatetime_str(String createtime_str) {
        this.createtime_str = createtime_str;
    }

    public int getComment_count() {
        return comment_count;
    }

    public void setComment_count(int comment_count) {
        this.comment_count = comment_count;
    }

    public String getSection_name() {
        return section_name;
    }

    public void setSection_name(String section_name) {
        this.section_name = section_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_avatar() {
        return user_avatar;
    }

    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }
}
