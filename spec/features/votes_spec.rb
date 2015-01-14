require 'rails_helper'

feature "Vote functionality" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:post) { FactoryGirl.create(
      :post,
      user: user,
      category: category,
      content: "test" )}

   scenario "downvote functionality works" do
    sign_in_as! user
    visit category_post_path(post.category_id, post.id)
    click_on 'Downvote'
    expect(post.votes.last.postive_vote).to be false       
    end
end
