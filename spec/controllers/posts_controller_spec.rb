require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with a HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "POST #create" do
    it "creates a post with post params" do
      post :create, post: { title: 'My First Post', description: 'My first post description' } #FactoryGirl.create(:post)
      expect(Post.count).to eq(1)
    end

    it "redirects to show page of post controller" do
      post :create, post: { title: 'My First Post', description: 'My first post description' }
      expect(response).to redirect_to(Post.first)
    end

    it "does not allow to create a post without title" do
      post :create, post: { description: 'My first post description' }
      expect(Post.count).to eq(0)
    end

    it "renders new template if failed to create post" do
      post :create, post: { description: 'My first post description' }
      expect(response).to render_template('new')
    end
  end

  describe "PUT update/:id" do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it "should render edit template if title is nil" do
      @attr = { title: nil, description: "My first post description" }
      put :update, id: @post.id, post: @attr

      expect(response).to render_template('edit')
    end

    it "should redirectly successfully to post page after successful updation" do
      @attr = { title: 'My First Post', description: 'First title descrption updated' }
      put :update, id: @post.id, post: @attr

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(@post)
    end

    it "should validate post title and description after update" do
      @attr = { title: 'My 1st Post', description: 'My 1st post descrption updated' }
      put :update, id: @post.id, post: @attr
      @post.reload

      expect(@post.title).to eql(@attr[:title])
      expect(@post.description).to eql(@attr[:description])
    end
  end

  describe "show post/:id" do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it "renders show template" do
      get :show, id: @post.id

      expect(response).to have_http_status(200)
      expect(@post.id).to eq(@post.id)
      expect(response).to render_template('show')
    end
  end

  describe "edit post/:id/edit" do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it "renders edit template when id is passed" do
      get :edit, id: @post.id

      expect(response).to have_http_status(200)
      expect(response).to render_template('edit')
    end
  end

  describe "destroy post/:id" do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it "destroys the post with valid post ID" do
      delete :destroy, id: @post.id

      expect(response).should redirect_to(posts_path)
    end
  end

#  describe "show_comments/:id" do
#    it "allows comments to render for each post" do
#      @post = FactoryGirl.create(:post)
#      get :show_comments, { format: :js }, id: @post.id
#
#      expect(response).to render_template('show_comments')
#    end
#  end
end
