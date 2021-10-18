# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 6, maximum: 20 }
  validates :description, presence: true, length: { maximum: 150 }
end
