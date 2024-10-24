# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /posts", type: :request do
  let!(:post_one) { create(:post) }
  let!(:post_two) { create(:post) }

  describe "GET /index" do
    it "returns a successful response" do
      get posts_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(post_one.title)
      expect(response.body).to include(post_one.title)
    end
  end
end
