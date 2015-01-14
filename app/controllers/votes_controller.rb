class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @post = Post.find params[:post]
    @upvote = @post.votes.find_or_initialize_by(user_id: current_user.id)
    @upvote.update_attributes(postive_vote: true)
    if @upvote.valid?
      vote_count(@post)
    end
    if @post.parent_id.nil?
      redirect_to category_post_path(@post.category_id, @post.id)
    else
      redirect_to category_post_path(@post.category_id, @post.parent_id)
    end
  end

  def destroy
    @post = Post.find params[:post]
    @downvote = @post.votes.find_or_initialize_by(user_id: current_user.id)
    @downvote.update_attributes(postive_vote: false)
    if @downvote.valid?
      vote_count(@post)
    end
    if @post.parent_id.nil?
      redirect_to category_post_path(@post.category_id, @post.id)
    else
      redirect_to category_post_path(@post.category_id, @post.parent_id)
    end
  end

  private

  def vote_count(post)
    count = post.votes.where(postive_vote: true).count - post.votes.where(postive_vote: false).count
    post.update_attributes(vote_count: count)
  end

end
