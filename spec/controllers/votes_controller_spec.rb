require 'rails_helper'

RSpec.describe VotesController, type: :controller do


  let(:test_category) { FactoryGirl.create :category }
  let(:test_post) { FactoryGirl.create :post }
  let(:test_user) { FactoryGirl.create :user }
  let(:test_vote) { test_post.votes.create :vote }


  describe "#create" do
    
    it "creates the vote if valid params" do
      allow(controller).to receive(:current_user) { test_user }
      expect {
        post :create,
          post: test_post.id
      }.to change { Vote.count }.by(1)
    end

    it "does not create the vote if invalid params" do
      allow(controller).to receive(:current_user) { test_user }
      Vote.create(user_id: test_user.id, voteable_id: test_post.id)
      expect {
        post :create,
          post: test_post.id
      }.to change { Vote.count }.by(1)
    end

  end

end