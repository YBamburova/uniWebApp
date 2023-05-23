package entity;

import com.uniweb.entity.PassedTest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

class PassedTestTest {
    PassedTest passedTest = null;

    final Integer id = 42;
    final Integer userID = 1;
    final Integer testID = 23;
    final Integer result = 99;
    final Integer timeSpent = 2000;

    final Integer anotherId = 42;
    final Integer anotherUserID = 1;
    final Integer anotherTestID = 23;
    final Integer anotherResult = 99;
    final Integer anotherTimeSpent = 2000;

    final String toString = "PassedTest{id="+id+", userID="+userID+", testID="+testID+", result="+result+", timeSpent="+timeSpent+"}";

    @BeforeEach
    void setUp() {
        passedTest = new PassedTest();
        passedTest.setId(id);
        passedTest.setUserID(userID);
        passedTest.setTestID(testID);
        passedTest.setResult(result);
        passedTest.setTimeSpent(timeSpent);

    }

    @Test
    void getId() {
        assertThat(id, equalTo(passedTest.getId()));
    }

    @Test
    void setId() {
        passedTest.setId(anotherId);
        assertThat(anotherId, equalTo(passedTest.getId()));
    }

    @Test
    void getUserID() {
        assertThat(userID, equalTo(passedTest.getUserID()));
    }

    @Test
    void setUserID() {
        passedTest.setUserID(anotherUserID);
        assertThat(anotherUserID, equalTo(passedTest.getUserID()));
    }

    @Test
    void getTestID() {
        assertThat(testID, equalTo(passedTest.getTestID()));
    }

    @Test
    void setTestID() {
        passedTest.setTestID(anotherTestID);
        assertThat(anotherTestID,equalTo(passedTest.getTestID()));
    }

    @Test
    void getResult() {
        assertThat(result,equalTo(passedTest.getResult()));
    }

    @Test
    void setResult() {
        passedTest.setResult(anotherResult);
        assertThat(anotherResult,equalTo(passedTest.getResult()));
    }

    @Test
    void getTimeSpent() {
        assertThat(timeSpent,equalTo(passedTest.getTimeSpent()));
    }

    @Test
    void setTimeSpent() {
        passedTest.setTimeSpent(anotherTimeSpent);
        assertThat(anotherTimeSpent, equalTo(passedTest.getTimeSpent()));

    }

    @Test
    void testToString() {
       assertThat(toString, equalTo(passedTest.toString()));
    }
}