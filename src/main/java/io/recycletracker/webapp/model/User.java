package io.recycletracker.webapp.model;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 12:23 PM
 */
@Document
public class User {

    @Id
    private String id;

    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String country;
    private String countryState;
    private String comments;

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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



    @Override
    public String toString() {
        return "User [id=" + id + ", firstName=" + firstName + ", lastName="
                + lastName + ", userName=" + userName + ", password="
                + password  + "]";
    }
}

