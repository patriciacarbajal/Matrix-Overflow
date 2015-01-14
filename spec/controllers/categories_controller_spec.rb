require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  context "on the index page" do
    describe "the page" do
      it "should have a list of all categories available" do
        get :index
        expect(response).to be_success
      end
    end
  end
end
