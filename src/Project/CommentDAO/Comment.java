package Project.CommentDAO;

public class Comment {
    private int article_id;

    private String userName;

    private String text;

    private String date;

    private int comment_id;

    private boolean isHidden;

    public Comment(int article_id, String userName, String text) {
        this.article_id = article_id;
        this.userName = userName;
        this.text = text;
    }

    public Comment(int article_id, String userName, String text,String date) {
        this.article_id = article_id;
        this.userName = userName;
        this.text = text;
        this.date = date;
    }


    public Comment(int article_id, String userName, String text,String date,int comment_id) {
        this.article_id = article_id;
        this.userName = userName;
        this.text = text;
        this.date = date;
        this.comment_id=comment_id;
    }

    public Comment(int article_id, String userName, String text,String date,int comment_id, boolean isHidden) {
        this.article_id = article_id;
        this.userName = userName;
        this.text = text;
        this.date = date;
        this.comment_id=comment_id;
        this.isHidden = isHidden;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getComment_id() {
        return comment_id;
    }
    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public boolean isHidden() {
        return isHidden;
    }

    public void setHidden(boolean hidden) {
        isHidden = hidden;
    }
}
