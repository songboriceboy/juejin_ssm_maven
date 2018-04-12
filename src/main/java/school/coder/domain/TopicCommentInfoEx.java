package school.coder.domain;

/**
 * Created by Administrator on 2018/2/20.
 */


public class TopicCommentInfoEx extends TopicCommentInfo {
    private int tci_comment_id;
    private String user_name;
    private String user_avatar;

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

    public int getTci_comment_id() {
        return tci_comment_id;
    }

    public void setTci_comment_id(int tci_comment_id) {
        this.tci_comment_id = tci_comment_id;
    }

}
