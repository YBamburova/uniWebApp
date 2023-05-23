package com.uniweb.entity;

public class TestPass {
    private Integer questionID;
    private String option1Chosen;
    private String option2Chosen;
    private String option3Chosen;
    private String option4Chosen;

    public Integer getQuestionID() {
        return questionID;
    }

    public void setQuestionID(Integer questionID) {
        this.questionID = questionID;
    }

    public String getOption1Chosen() {
        return option1Chosen;
    }

    public void setOption1Chosen(String option1Chosen) {
        this.option1Chosen = option1Chosen;
    }

    public String getOption2Chosen() {
        return option2Chosen;
    }

    public void setOption2Chosen(String option2Chosen) {
        this.option2Chosen = option2Chosen;
    }

    public String getOption3Chosen() {
        return option3Chosen;
    }

    public void setOption3Chosen(String option3Chosen) {
        this.option3Chosen = option3Chosen;
    }

    public String getOption4Chosen() {
        return option4Chosen;
    }

    public void setOption4Chosen(String option4Chosen) {
        this.option4Chosen = option4Chosen;
    }

    @Override
    public String toString() {
        return "TestPass{" +
                "questionID=" + questionID +
                ", option1Chosen='" + option1Chosen + '\'' +
                ", option2Chosen='" + option2Chosen + '\'' +
                ", option3Chosen='" + option3Chosen + '\'' +
                ", option4Chosen='" + option4Chosen + '\'' +
                '}';
    }
}
