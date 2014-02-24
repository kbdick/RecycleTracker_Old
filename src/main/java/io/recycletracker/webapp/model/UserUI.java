package io.recycletracker.webapp.model;


import java.io.Serializable;

/**
 * User: alexthornburg
 * Date: 2/24/14
 * Time: 10:34 AM
 */
public class UserUI implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String country;
    private String countryState;
    private String comments;

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
        return "[" + id + ", firstName=" + firstName + ", lastName=" + lastName
                + ", userName=" + userName + ", password=" + password + "]";
    }
}
