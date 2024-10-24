package feelfree.lol.Entities;

import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

@Data
@Entity
@Table(name="reactions")
public class Reaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String type; // e.g., like, love, haha

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    @JsonBackReference(value = "user-reaction")
    private User user;

    @ManyToOne
    @JoinColumn(name = "post_id", nullable = false)
    @JsonBackReference(value = "post-reaction")
    private Post post;
}
