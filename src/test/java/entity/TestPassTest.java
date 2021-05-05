package entity;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.jupiter.api.Assertions.*;

class TestPassTest {
    TestPass testPass = null;
    final Integer questionID = 42;
    final String option1Chosen = "true";
    final String option2Chosen = "true";
    final String option3Chosen = "true";
    final String option4Chosen = "true";

    final Integer anotherQuestionID = 35;
    final String anotherOption1Chosen = "false";
    final String anotherOption2Chosen = "false";
    final String anotherOption3Chosen = "false";
    final String anotherOption4Chosen = "false";

    final String toString = "TestPass{questionID="+questionID+", option1Chosen='"+option1Chosen+"', option2Chosen='"+option2Chosen+"', option3Chosen='"+option3Chosen+"', option4Chosen='"+option4Chosen+"'}";

    @BeforeEach
    void setUp() {
        testPass = new TestPass();
        testPass.setQuestionID(questionID);
        testPass.setOption1Chosen(option1Chosen);
        testPass.setOption2Chosen(option2Chosen);
        testPass.setOption3Chosen(option3Chosen);
        testPass.setOption4Chosen(option4Chosen);
    }

    @Test
    void getQuestionID() {
        assertThat(questionID, equalTo(testPass.getQuestionID()));
    }

    @Test
    void setQuestionID() {
        testPass.setQuestionID(anotherQuestionID);
        assertThat(anotherQuestionID, equalTo(testPass.getQuestionID()));
    }

    @Test
    void getOption1Chosen() {
        assertThat(option1Chosen, equalTo(testPass.getOption1Chosen()));
    }

    @Test
    void setOption1Chosen() {
        testPass.setOption1Chosen(anotherOption1Chosen);
        assertThat(anotherOption1Chosen, equalTo(testPass.getOption1Chosen()));
    }

    @Test
    void getOption2Chosen() {
        assertThat(option2Chosen, equalTo(testPass.getOption2Chosen()));
    }

    @Test
    void setOption2Chosen() {
        testPass.setOption2Chosen(anotherOption2Chosen);
        assertThat(anotherOption2Chosen, equalTo(testPass.getOption2Chosen()));
    }

    @Test
    void getOption3Chosen() {
        assertThat(option3Chosen, equalTo(testPass.getOption3Chosen()));
    }

    @Test
    void setOption3Chosen() {
        testPass.setOption3Chosen(anotherOption3Chosen);
        assertThat(anotherOption3Chosen, equalTo(testPass.getOption3Chosen()));
    }

    @Test
    void getOption4Chosen() {
        assertThat(option4Chosen, equalTo(testPass.getOption4Chosen()));
    }

    @Test
    void setOption4Chosen() {
        testPass.setOption4Chosen(anotherOption4Chosen);
        assertThat(anotherOption4Chosen, equalTo(testPass.getOption4Chosen()));
    }

    @Test
    void testToString() {
        assertThat(toString, equalTo(testPass.toString()));
    }
}