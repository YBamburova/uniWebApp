package entity;

public class PassedTest {
    private Integer id;
    private Integer userID;
    private Integer testID;
    private Integer result;
    private Integer timeSpent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getTestID() {
        return testID;
    }

    public void setTestID(Integer testID) {
        this.testID = testID;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getTimeSpent() {
        return timeSpent;
    }

    public void setTimeSpent(Integer timeSpent) {
        this.timeSpent = timeSpent;
    }

    @Override
    public String toString() {
        return "PassedTest{" +
                "id=" + id +
                ", userID=" + userID +
                ", testID=" + testID +
                ", result=" + result +
                ", timeSpent=" + timeSpent +
                '}';
    }
}
