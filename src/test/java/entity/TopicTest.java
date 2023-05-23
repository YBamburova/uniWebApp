package entity;

import com.uniweb.entity.Topic;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;




import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;


class TopicTest {
    Topic topic = null;
    final String NAME = "Hitchhiker's Guide to the Galaxy";
    final Integer ID = 42;
    final String ANOTHER_NAME = "New Name";
    final Integer ANOTHER_ID = 40;
    final String TO_STRING = "Topic{id=42, name='Hitchhiker's Guide to the Galaxy'}";

    @BeforeEach
    void init() {
        topic = new Topic();
        topic.setName(NAME);
        topic.setId(ID);
    }

    @Test
    void getId() {
        assertThat(ID, equalTo(topic.getId()));

    }

    @Test
    void setId() {
        topic.setId(ANOTHER_ID);
        assertThat(ANOTHER_ID, equalTo(topic.getId()));
    }

    @Test
    void getName() {
        assertThat(NAME, equalTo(topic.getName()));
    }

    @Test
    void setName() {
        topic.setName(ANOTHER_NAME);
        assertThat(ANOTHER_NAME, equalTo(topic.getName()));
    }

    @Test
    void testToString() {
        assertThat(TO_STRING, equalTo(topic.toString()));
    }
}