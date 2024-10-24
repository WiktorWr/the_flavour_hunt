# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /posts/:id", type: :request do
  let!(:post) { create(:post) }

  describe "GET /show" do
    it "returns a successful response" do
      get post_path(post)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(post.title)
    end
  end
end
