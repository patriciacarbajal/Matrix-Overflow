class AddVoteTypeColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :postive_vote, :boolean
  end
end
