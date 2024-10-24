package feelfree.lol.Service;

import feelfree.lol.Entities.Reaction;
import feelfree.lol.Repositories.ReactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReactionService {
    @Autowired
    private ReactionRepository reactionRepository;

    public List<Reaction> getReactionsByPostId(Long postId) {
        return reactionRepository.findByPostId(postId);
    }

    public Reaction getReactionById(Long id) {
        return reactionRepository.findById(id).orElse(null);
    }

    public Reaction createReaction(Reaction reaction) {
        return reactionRepository.save(reaction);
    }

    public void deleteReaction(Long id) {
        reactionRepository.deleteById(id);
    }
}
