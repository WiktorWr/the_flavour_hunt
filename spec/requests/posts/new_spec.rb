# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /posts/new", type: :request do
  describe "GET /new" do
    it "returns a successful response" do
      get new_post_path
      expect(response).to have_http_status(:ok)
    end
  end
end
