package entity;

import java.util.List;

public class Test {
    private Integer id;
    private String name;
    private Integer complexity;
    private Integer numberOfRequests;
    private Integer timeForTest;
    private Integer topic;
    private List<Question> questions;

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", complexity=" + complexity +
                ", numberOfRequests=" + numberOfRequests +
                ", timeForTest=" + timeForTest +
                ", topic=" + topic +
                ", list=" + questions +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getComplexity() {
        return complexity;
    }

    public void setComplexity(Integer complexity) {
        this.complexity = complexity;
    }

    public Integer getNumberOfRequests() {
        return numberOfRequests;
    }

    public void setNumberOfRequests(Integer numberOfRequests) {
        this.numberOfRequests = numberOfRequests;
    }

    public Integer getTimeForTest() {
        return timeForTest;
    }

    public void setTimeForTest(Integer timeForTest) {
        this.timeForTest = timeForTest;
    }

    public Integer getTopic() {
        return topic;
    }

    public void setTopic(Integer topic) {
        this.topic = topic;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
