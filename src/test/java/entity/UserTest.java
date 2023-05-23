package entity;

import com.uniweb.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

class UserTest {
    User user = null;
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

    final String toString = "User{id="+id+", username='"+username+"', name='"+name+"', surname='"+surname+"', email='"+email+"', password='"+password+"', isBlocked='"+isBlocked+"', type='"+type+"'}";


    @BeforeEach
    void setUp() {
        user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPassword(password);
        user.setIsBlocked(isBlocked);
        user.setType(type);
    }

    @Test
    void getId() {
        assertThat(id, equalTo(user.getId()));
    }

    @Test
    void setId() {
        user.setId(anotherId);
        assertThat(anotherId, equalTo(user.getId()));
    }

    @Test
    void getUsername() {
        assertThat(username, equalTo(user.getUsername()));
    }

    @Test
    void setUsername() {
        user.setUsername(anotherUsername);
        assertThat(anotherUsername, equalTo(user.getUsername()));
    }

    @Test
    void getName() {
        assertThat(name, equalTo(user.getName()));
    }

    @Test
    void setName() {
        user.setName(anotherName);
        assertThat(anotherName, equalTo(user.getName()));
    }

    @Test
    void getSurname() {
        assertThat(surname, equalTo(user.getSurname()));
    }

    @Test
    void setSurname() {
        user.setSurname(anotherSurname);
        assertThat(anotherSurname, equalTo(user.getSurname()));
    }

    @Test
    void getEmail() {
        assertThat(email, equalTo(user.getEmail()));
    }

    @Test
    void setEmail() {
        user.setEmail(anotherEmail);
        assertThat(anotherEmail, equalTo(user.getEmail()));
    }

    @Test
    void getPassword() {
        assertThat(password, equalTo(user.getPassword()));
    }

    @Test
    void setPassword() {
        user.setPassword(anotherPassword);
        assertThat(anotherPassword, equalTo(user.getPassword()));
    }

    @Test
    void getIsBlocked() {
        assertThat(isBlocked, equalTo(user.getIsBlocked()));
    }

    @Test
    void setIsBlocked() {
        user.setIsBlocked(anotherIsBlocked);
        assertThat(anotherIsBlocked, equalTo(user.getIsBlocked()));
    }

    @Test
    void getType() {
        assertThat(type, equalTo(user.getType()));
    }

    @Test
    void setType() {
        user.setType(anotherType);
        assertThat(anotherType, equalTo(user.getType()));
    }

    @Test
    void testToString() {
        assertThat(toString, equalTo(user.toString()));
    }
}