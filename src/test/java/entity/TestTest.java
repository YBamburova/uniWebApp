package entity;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

class TestTest {
    entity.Test test = null;

    final List<Question> questions = new ArrayList<>();
    final List<Question> anotherQuestions = new ArrayList<>();
    final Question question = new Question();
    final Question anotherQuestion = new Question();

    final Integer id = 40;
    final String name = "Java Basics Quiz";
    final Integer complexity = 4;
    final Integer numberOfRequests = 10;
    final Integer timeForTest = 25;
    final Integer topic = 2;

    final Integer anotherId = 52;
    final String anotherName = "JSTEST";
    final Integer anotherComplexity = 8;
    final Integer anotherNumberOfRequests = 25;
    final Integer anotherTimeForTest = 45;
    final Integer anotherTopic = 3;

    final String toString = "Test{id=" + id + ", name='" + name + "', complexity=" + complexity + ", numberOfRequests=" + numberOfRequests + ", timeForTest=" + timeForTest + ", topic=" + topic + ", list=[Question{id=1, testID=1, text='questionText', option1='Option1', option2='Option2', option3='Option3', option4='Option4', option1IsCorrect='true', option2IsCorrect='true', option3IsCorrect='true', option4IsCorrect='true'}]}";

    @BeforeEach
    void setUp() {
        test = new entity.Test();
        test.setId(id);
        test.setName(name);
        test.setComplexity(complexity);
        test.setNumberOfRequests(numberOfRequests);
        test.setTimeForTest(timeForTest);
        test.setTopic(topic);
        test.setQuestions(questions);

        question.setText("questionText");
        question.setTestID(1);
        question.setId(1);
        question.setOption1("Option1");
        question.setOption1IsCorrect("true");
        question.setOption2("Option2");
        question.setOption2IsCorrect("true");
        question.setOption3("Option3");
        question.setOption3IsCorrect("true");
        question.setOption4("Option4");
        question.setOption4IsCorrect("true");
        questions.add(question);

        anotherQuestion.setText("questionText");
        anotherQuestion.setTestID(2);
        anotherQuestion.setId(2);
        anotherQuestion.setOption1("Option1");
        anotherQuestion.setOption1IsCorrect("false");
        anotherQuestion.setOption2("Option2");
        anotherQuestion.setOption2IsCorrect("false");
        anotherQuestion.setOption3("Option3");
        anotherQuestion.setOption3IsCorrect("false");
        anotherQuestion.setOption4("Option4");
        anotherQuestion.setOption4IsCorrect("false");
        anotherQuestions.add(anotherQuestion);
    }

    @Test
    void testToString() {
        assertThat(toString, equalTo(test.toString()));
    }

    @Test
    void getId() {
        assertThat(id, equalTo(test.getId()));
    }

    @Test
    void setId() {
        test.setId(anotherId);
        assertThat(anotherId, equalTo(test.getId()));
    }

    @Test
    void getName() {
        assertThat(name, equalTo(test.getName()));
    }

    @Test
    void setName() {
        test.setName(anotherName);
        assertThat(anotherName, equalTo(test.getName()));
    }

    @Test
    void getComplexity() {
        assertThat(complexity, equalTo(test.getComplexity()));
    }

    @Test
    void setComplexity() {
        test.setComplexity(anotherComplexity);
        assertThat(anotherComplexity, equalTo(test.getComplexity()));
    }

    @Test
    void getNumberOfRequests() {
        assertThat(numberOfRequests, equalTo(test.getNumberOfRequests()));
    }

    @Test
    void setNumberOfRequests() {
        test.setNumberOfRequests(anotherNumberOfRequests);
        assertThat(anotherNumberOfRequests, equalTo(test.getNumberOfRequests()));
    }

    @Test
    void getTimeForTest() {
        assertThat(timeForTest, equalTo(test.getTimeForTest()));
    }

    @Test
    void setTimeForTest() {
        test.setTimeForTest(anotherTimeForTest);
        assertThat(anotherTimeForTest, equalTo(test.getTimeForTest()));
    }

    @Test
    void getTopic() {
        assertThat(topic, equalTo(test.getTopic()));
    }

    @Test
    void setTopic() {
        test.setTopic(anotherTopic);
        assertThat(anotherTopic, equalTo(test.getTopic()));
    }

    @Test
    void getQuestions() {
        assertThat(questions, equalTo(test.getQuestions()));
    }

    @Test
    void setQuestions() {
        test.setQuestions(anotherQuestions);
        assertThat(anotherQuestions, equalTo(test.getQuestions()));

    }
}