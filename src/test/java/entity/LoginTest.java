package entity;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.jupiter.api.Assertions.*;

class LoginTest {

    Login login = null;

    final Integer id = 42;
    final String username = "IsaiahPearson";
    final String name = "Isaiah";
    final String surname = "Pearson";
    final String email = "isaiah.pearson@example.com";
    final String password = "nYc9dqlh";
    final String isBlocked = "false";
    final String type = "student";

    final Integer anotherId = 35;
    final String anotherUsername = "GeorgiaJennings";
    final String anotherName = "Georgia";
    final String anotherSurname = "Jennings";
    final String anotherEmail = "georgia.jennings@example.com";
    final String anotherPassword = "6MihNUav";
    final String anotherIsBlocked = "true";
    final String anotherType = "admin";

    final String toString = "Login{id="+id+", username='"+username+"', password='"+password+"', " +
            "type='"+type+"', name='"+name+"', surname='"+surname+"', email='"+email+"', isBlocked='"+isBlocked+"'}";

    @BeforeEach
    void setUp() {
        login = new Login();
        login.setId(id);
        login.setUsername(username);
        login.setName(name);
        login.setSurname(surname);
        login.setEmail(email);
        login.setPassword(password);
        login.setIsBlocked(isBlocked);
        login.setType(type);
    }

    @Test
    void getName() {
        assertThat(name, equalTo(login.getName()));
    }

    @Test
    void setName() {
        login.setName(anotherName);
        assertThat(anotherName, equalTo(login.getName()));
    }

    @Test
    void getSurname() {
        assertThat(surname, equalTo(login.getSurname()));
    }

    @Test
    void setSurname() {
        login.setSurname(anotherSurname);
        assertThat(anotherSurname, equalTo(login.getSurname()));
    }

    @Test
    void getEmail() {
        assertThat(email, equalTo(login.getEmail()));
    }

    @Test
    void setEmail() {
        login.setEmail(anotherEmail);
        assertThat(anotherEmail, equalTo(login.getEmail()));
    }

    @Test
    void getIsBlocked() {
        assertThat(isBlocked, equalTo(login.getIsBlocked()));
    }

    @Test
    void setIsBlocked() {
        login.setIsBlocked(anotherIsBlocked);
        assertThat(anotherIsBlocked, equalTo(login.getIsBlocked()));
    }

    @Test
    void getType() {
        assertThat(type, equalTo(login.getType()));
    }

    @Test
    void setType() {
        login.setType(anotherType);
        assertThat(anotherType, equalTo(login.getType()));
    }

    @Test
    void getId() {
        assertThat(id, equalTo(login.getId()));
    }

    @Test
    void setId() {
        login.setId(anotherId);
        assertThat(anotherId, equalTo(login.getId()));
    }

    @Test
    void getUsername() {
        assertThat(username, equalTo(login.getUsername()));
    }

    @Test
    void setUsername() {
        login.setUsername(anotherUsername);
        assertThat(anotherUsername, equalTo(login.getUsername()));
    }

    @Test
    void getPassword() {
        assertThat(password, equalTo(login.getPassword()));
    }

    @Test
    void setPassword() {
        login.setPassword(anotherPassword);
        assertThat(anotherPassword, equalTo(login.getPassword()));
    }

    @Test
    void testToString() {
        assertThat(toString,equalTo(login.toString()));
    }
}