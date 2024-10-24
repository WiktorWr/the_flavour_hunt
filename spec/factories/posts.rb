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
FactoryBot.define do
  factory :post do
    body  { Faker::Lorem.paragraph.truncate(Post::BODY_MAX_LENGTH) }
    title { Faker::Book.title.truncate(Post::TITLE_MAX_LENGTH) }
  end
end
