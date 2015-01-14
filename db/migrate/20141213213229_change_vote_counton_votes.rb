class ChangeVoteCountonVotes < ActiveRecord::Migration
  def change
    change_column_default :posts, :vote_count, 0
  end
end
