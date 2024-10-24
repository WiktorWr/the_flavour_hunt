# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    describe "validating title" do
      context "when is nil" do
        let!(:post) { build(:post, title: nil) }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when is empty" do
        let!(:post) { build(:post, title: "") }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when is too short" do
        let!(:post) { build(:post, title: "123") }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when is too long" do
        let!(:post) { build(:post, title: Faker::Lorem.characters(number: Post::TITLE_MAX_LENGTH + 1)) }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when everything is fine" do
        let!(:post) { build(:post) }

        it "is invalid" do
          expect(post).to be_valid
        end
      end
    end

    describe "validating body" do
      context "when is nil" do
        let!(:post) { build(:post, body: nil) }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when is empty" do
        let!(:post) { build(:post, body: "") }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when is too long" do
        let!(:post) { build(:post, body: Faker::Lorem.characters(number: Post::BODY_MAX_LENGTH + 1)) }

        it "is invalid" do
          expect(post).not_to be_valid
        end
      end

      context "when everything is fine" do
        let!(:post) { build(:post) }

        it "is invalid" do
          expect(post).to be_valid
        end
      end
    end
  end
end
