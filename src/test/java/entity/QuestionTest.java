package entity;

import com.uniweb.entity.Question;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

class QuestionTest {

    Question question = null;

    final Integer id = 1;
    final Integer testID = 1;
    final String text = "questionText";
    final String option1 = "Option1";
    final String option2 = "Option2";
    final String option3 = "Option3";
    final String option4 = "Option4";
    final String option1IsCorrect = "true";
    final String option2IsCorrect = "true";
    final String option3IsCorrect = "true";
    final String option4IsCorrect = "true";

    final String toString = "Question{id=" + id + ", testID=" + testID + ", " +
            "text='" + text + "', option1='" + option1 + "', option2='" + option2 + "', " +
            "option3='" + option3 + "', option4='" + option4 + "', option1IsCorrect='" + option1IsCorrect + "', " +
            "option2IsCorrect='" + option2IsCorrect + "', option3IsCorrect='" + option3IsCorrect + "', option4IsCorrect='" + option4IsCorrect + "'}";

    final Integer anotherId = 1;
    final Integer anotherTestID = 1;
    final String anotherText = "questionText";
    final String anotherOption1 = "Option1";
    final String anotherOption2 = "Option2";
    final String anotherOption3 = "Option3";
    final String anotherOption4 = "Option4";
    final String anotherOption1IsCorrect = "true";
    final String anotherOption2IsCorrect = "true";
    final String anotherOption3IsCorrect = "true";
    final String anotherOption4IsCorrect = "true";


    @BeforeEach
    void setUp() {
        question = new Question();
        question.setId(id);
        question.setTestID(testID);
        question.setText(text);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setOption4(option4);
        question.setOption1IsCorrect(option1IsCorrect);
        question.setOption2IsCorrect(option2IsCorrect);
        question.setOption3IsCorrect(option3IsCorrect);
        question.setOption4IsCorrect(option4IsCorrect);

    }

    @Test
    void testToString() {
        assertThat(toString, equalTo(question.toString()));
    }

    @Test
    void getId() {
        assertThat(id, equalTo(question.getId()));
    }

    @Test
    void setId() {
        question.setId(anotherId);
        assertThat(anotherId, equalTo(question.getId()));
    }

    @Test
    void getTestID() {
        assertThat(testID, equalTo(question.getTestID()));
    }

    @Test
    void setTestID() {
        question.setTestID(anotherTestID);
        assertThat(anotherTestID, equalTo(question.getTestID()));
    }

    @Test
    void getText() {
        assertThat(text, equalTo(question.getText()));
    }

    @Test
    void setText() {
        question.setText(anotherText);
        assertThat(anotherText, equalTo(question.getText()));
    }

    @Test
    void getOption1() {
        assertThat(option1, equalTo(question.getOption1()));
    }

    @Test
    void setOption1() {
        question.setOption1(anotherOption1);
        assertThat(anotherOption1, equalTo(question.getOption1()));
    }

    @Test
    void getOption2() {
        assertThat(option2, equalTo(question.getOption2()));
    }

    @Test
    void setOption2() {
        question.setOption2(anotherOption2);
        assertThat(anotherOption2, equalTo(question.getOption2()));
    }

    @Test
    void getOption3() {
        assertThat(option3, equalTo(question.getOption3()));
    }

    @Test
    void setOption3() {
        question.setOption3(anotherOption3);
        assertThat(anotherOption3, equalTo(question.getOption3()));
    }

    @Test
    void getOption4() {
        assertThat(option4, equalTo(question.getOption4()));
    }

    @Test
    void setOption4() {
        question.setOption4(anotherOption4);
        assertThat(anotherOption4, equalTo(question.getOption4()));
    }

    @Test
    void getOption1IsCorrect() {
        assertThat(option1IsCorrect, equalTo(question.getOption1IsCorrect()));
    }

    @Test
    void setOption1IsCorrect() {
        question.setOption1IsCorrect(anotherOption1IsCorrect);
        assertThat(anotherOption1IsCorrect, equalTo(question.getOption1IsCorrect()));
    }

    @Test
    void getOption2IsCorrect() {
        assertThat(option2IsCorrect, equalTo(question.getOption2IsCorrect()));
    }

    @Test
    void setOption2IsCorrect() {
        question.setOption2IsCorrect(anotherOption2IsCorrect);
        assertThat(anotherOption2IsCorrect, equalTo(question.getOption2IsCorrect()));
    }

    @Test
    void getOption3IsCorrect() {
        assertThat(option3IsCorrect, equalTo(question.getOption3IsCorrect()));
    }

    @Test
    void setOption3IsCorrect() {
        question.setOption3IsCorrect(anotherOption3IsCorrect);
        assertThat(anotherOption3IsCorrect, equalTo(question.getOption3IsCorrect()));
    }

    @Test
    void getOption4IsCorrect() {
        assertThat(option4IsCorrect, equalTo(question.getOption4IsCorrect()));
    }

    @Test
    void setOption4IsCorrect() {
        question.setOption4IsCorrect(anotherOption4IsCorrect);
        assertThat(anotherOption4IsCorrect, equalTo(question.getOption4IsCorrect()));
    }
}