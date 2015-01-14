module VotesHelper  
  def vote_limit(post, user)
    if post.votes.any? { |vote| vote.user_id == user.id}
      user.restrict_voting
    end
  end
end