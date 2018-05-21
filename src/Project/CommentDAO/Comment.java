package Project.CommentDAO;

public class Comment {
    private int article_id;

    private String userName;

    private String text;

    private String date;

    public Comment(int article_id, String userName, String text, String date) {
        this.article_id = article_id;
        this.userName = userName;
        this.text = text;
        this.date = date;
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
}
