package entity;

public class Question {
    private Integer id;
    private Integer testID;
    private String text;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String option1IsCorrect;
    private String option2IsCorrect;
    private String option3IsCorrect;
    private String option4IsCorrect;

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", testID=" + testID +
                ", text='" + text + '\'' +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", option3='" + option3 + '\'' +
                ", option4='" + option4 + '\'' +
                ", option1IsCorrect='" + option1IsCorrect + '\'' +
                ", option2IsCorrect='" + option2IsCorrect + '\'' +
                ", option3IsCorrect='" + option3IsCorrect + '\'' +
                ", option4IsCorrect='" + option4IsCorrect + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTestID() {
        return testID;
    }

    public void setTestID(Integer testID) {
        this.testID = testID;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getOption1IsCorrect() {
        return option1IsCorrect;
    }

    public void setOption1IsCorrect(String option1IsCorrect) {
        this.option1IsCorrect = option1IsCorrect;
    }

    public String getOption2IsCorrect() {
        return option2IsCorrect;
    }

    public void setOption2IsCorrect(String option2IsCorrect) {
        this.option2IsCorrect = option2IsCorrect;
    }

    public String getOption3IsCorrect() {
        return option3IsCorrect;
    }

    public void setOption3IsCorrect(String option3IsCorrect) {
        this.option3IsCorrect = option3IsCorrect;
    }

    public String getOption4IsCorrect() {
        return option4IsCorrect;
    }

    public void setOption4IsCorrect(String option4IsCorrect) {
        this.option4IsCorrect = option4IsCorrect;
    }
}
