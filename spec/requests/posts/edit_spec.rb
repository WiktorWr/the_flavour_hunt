# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /posts/:id/edit", type: :request do
  let!(:post) { create(:post) }

  describe "GET /edit" do
    it "returns a successful response" do
      get edit_post_path(post)
      expect(response).to have_http_status(:ok)
    end
  end
end
