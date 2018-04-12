package school.coder.domain;

/**
 * Created by Administrator on 2018/2/21.
 */

public class SectionInfo {
    private int section_id;
    private String section_name;
    private String section_desc;
    private int section_parent_id;

    public int getSection_id() {
        return section_id;
    }

    public void setSection_id(int section_id) {
        this.section_id = section_id;
    }

    public String getSection_name() {
        return section_name;
    }

    public void setSection_name(String section_name) {
        this.section_name = section_name;
    }

    public String getSection_desc() {
        return section_desc;
    }

    public void setSection_desc(String section_desc) {
        this.section_desc = section_desc;
    }

    public int getSection_parent_id() {
        return section_parent_id;
    }

    public void setSection_parent_id(int section_parent_id) {
        this.section_parent_id = section_parent_id;
    }
}
