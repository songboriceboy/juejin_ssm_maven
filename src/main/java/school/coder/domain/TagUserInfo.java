package school.coder.domain;

/**
 * Created by ttc on 2018/4/19.
 */
public class TagUserInfo {
    private int tag_user_info_id;
    private int tag_id;
    private int user_id;

    public int getTag_user_info_id() {
        return tag_user_info_id;
    }

    public void setTag_user_info_id(int tag_user_info_id) {
        this.tag_user_info_id = tag_user_info_id;
    }

    public int getTag_id() {
        return tag_id;
    }

    public void setTag_id(int tag_id) {
        this.tag_id = tag_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
