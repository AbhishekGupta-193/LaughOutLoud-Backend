package feelfree.lol.Controllers;

import feelfree.lol.Entities.Reaction;
import feelfree.lol.Service.ReactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reactions")
public class ReactionController {
    @Autowired
    private ReactionService reactionService;

    @GetMapping("/post/{postId}")
    public List<Reaction> getReactionsByPostId(@PathVariable Long postId) {
        return reactionService.getReactionsByPostId(postId);
    }

    @GetMapping("/{id}")
    public Reaction getReactionById(@PathVariable Long id) {
        return reactionService.getReactionById(id);
    }

    @PostMapping
    public Reaction createReaction(@RequestBody Reaction reaction) {
        return reactionService.createReaction(reaction);
    }

    @DeleteMapping("/{id}")
    public void deleteReaction(@PathVariable Long id) {
        reactionService.deleteReaction(id);
    }
}

