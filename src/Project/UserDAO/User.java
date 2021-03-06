package Project.UserDAO;

public class User {
    private String userName;

    private String password;

    private String firstName;

    private String lastName;

    private String dateOfBirth;

    private String country;

    private String description;

    private String session;

    private String image;

    private boolean isAdmin;

    private String email;

    private String validateCode;

    private long expireTime;

    public User() {
    }

    public User(String userName, String password, String firstName, String lastName, String dateOfBirth, String country, String description, String image, String session, boolean isAdmin, String email, String validateCode, long expireTime) {
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.country = country;
        this.description = description;
        this.session = session;
        this.image = image;
        this.isAdmin = isAdmin;
        this.email = email;
        this.validateCode = validateCode;
        this.expireTime = expireTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSession() {
        return session;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public String getEmail() { return email; }

    public void setEmail(String email) {this.email = email;}

    public String getValidateCode() {
        return validateCode;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }

    public long getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(long expireTime) {
        this.expireTime = expireTime;
    }
}
