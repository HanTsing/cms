require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers


  describe 'GET#show'do

    let(:post) { FactoryGirl.create(:post) } 
    let(:user) { FactoryGirl.create(:admin_user) }

    it "assigns the requested post to @post" do
      sign_in user
      get :show, id: post
      expect(assigns(:post)).to eq post
    end

    it "renders the :show template" do
      sign_in user
      get :show, id: post
      expect(response).to render_template :show
    end

  end

  describe 'DELETEdestroy' do

    let(:post) { FactoryGirl.create(:post) } 
    let(:user) { FactoryGirl.create(:admin_user) }

    before :each do
      sign_in user
    end

    it "deletes the post" do
      post
      expect{
        delete :destroy, id: post
      }.to change(Post,:count).by(0)
    end

    it "redirects to posts#index" do
      delete :destroy, id: post
      expect(response).to redirect_to posts_url
    end 

  end


  describe 'PATCH#update' do

    let(:post) { FactoryGirl.create(:post) }
    let(:user) { FactoryGirl.create(:admin_user) }
    let(:invalid_post) { FactoryGirl.create(:invalid_post) }

    before :each do
      sign_in user
    end

    context "valid attributes" do

      it "update post" do
        put :update, id: post, post:  FactoryGirl.attributes_for(:post)
        expect(assigns(:post)).to eq(post)
      end

      it "changes @post's attributes" do 
        put :update, id: post, post:  FactoryGirl.attributes_for(:post, title: "title")
        post.reload
        expect(post.title).to eq("title")
      end

    end

  end
end
