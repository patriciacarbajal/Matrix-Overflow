require 'rails_helper'

RSpec.describe AdminsController, :type => :controller do

context "when a admin goes to login" do
    describe "admins#login" do
      it "loads a login page for an admin" do
        get :index
        expect(response).to be_success
      end
    end
  end

   context "while filling out the fields" do
    describe "admins#create" do
      it "doesn't allow an admin to be created if the fields aren't filled out" do
        expect{
          Admin.create(username: "lulu", password: "ghoul")
        }.to_not change(Admin, :count)
      end
    end
  end

context "while filling out the fields" do
    describe "admins#create" do
      it "allows an admin to be created if the fields are filled out" do
        expect{
          Admin.create(username: "lulu", email: "ghoul@2spooky.com", password: "ghoul")
        }.to change(Admin, :count)
      end
    end
  end

  end
