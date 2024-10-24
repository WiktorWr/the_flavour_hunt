# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST /posts", type: :request do
  let(:valid_attributes) do
    {
      title: "Valid Title",
      body:  "This is a valid body for the post."
    }
  end

  let(:invalid_attributes) do
    {
      title: "", # Invalid title (empty)
      body:  "This is a valid body for the post."
    }
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_path, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post posts_path, params: { post: valid_attributes }
        expect(response).to redirect_to(post_path(Post.last))
        follow_redirect!
        expect(response.body).to include(I18n.t("en.posts.notices.created"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_path, params: { post: invalid_attributes }
        }.not_to change(Post, :count)
      end

      it "renders the new template again" do
        post posts_path, params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("prohibited this post from being saved")
      end
    end
  end
end
