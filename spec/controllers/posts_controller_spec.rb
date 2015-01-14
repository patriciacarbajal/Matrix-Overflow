require 'rails_helper'

describe PostsController do
  let(:test_category) {FactoryGirl.create :category}
  let(:test_post) {FactoryGirl.create :post}
  let(:user) { FactoryGirl.create(:user) }


 describe "#index" do
    it "assigns the posts to Category.posts" do
      get :index, :category_id => test_category.id
      expect(response).to be_success
    end
  end

  describe "#new" do
    it "assigns the post to Post.new" do
      get :new, :category_id => test_category.id
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "#create" do
    it "creates the post if valid params" do
      allow(controller).to receive(:current_user) { user }
      expect {
        post :create,
        category_id: test_category.id,
        post: FactoryGirl.attributes_for(:post),
        user_id: user.id
      }.to change { Post.count }.by(1)
    end
  end

  describe "#edit" do
    it "assigns the post to the post" do
      get :edit, category_id: test_category.id, id: test_post.id
      expect(assigns(:post)).to eq(test_post)
    end
  end

  describe "#update" do
    it "updates the post if valid params" do
      expect {
        put :update, category_id: test_category.id, id: test_post.id, post: {
          title: 'my new title',
          content: 'my new content'
        }
      }.to change { test_post.reload.content }.to('my new content')
    end
  end

  describe "#destroy" do
    it "deletes the post" do
      test_post
      expect {
        delete :destroy, category_id: test_category.id, id: test_post.id
      }.to change {Post.count}.by(-1)
    end
  end
end
