package Project.ArticleDAO;

public class Article {

    private Integer id;

    private String title;

    private String content;

    private String genre;

    private String author;

    private String date;

    private boolean isHidden;

    public Article(Integer id, String title, String content, String genre, String authorID, String date, boolean isHidden) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.genre = genre;
        this.author = authorID;
        this.date = date;
        this.isHidden = isHidden;
    }

    public Article(Integer id, String title, String content, String genre, String authorID, String date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.genre = genre;
        this.author = authorID;
        this.date = date;
    }

    public Article(Integer id, String title, String content, String genre, String authorID) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.genre = genre;
        this.author = authorID;
    }

    public Article(String title, String content, String genre, String authorID) {
        this.title = title;
        this.content = content;
        this.genre = genre;
        this.author = authorID;
    }

    public Article(String title, String content, String genre, String authorID, String date) {
        this.title = title;
        this.content = content;
        this.genre = genre;
        this.author = authorID;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getGenre() {
        return genre;
    }

    public String getAuthor() {
        return author;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isHidden() {
        return isHidden;
    }

    public void setHidden(boolean hidden) {
        isHidden = hidden;
    }
}
