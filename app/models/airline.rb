# frozen_string_literal: true

class Airline < ApplicationRecord
  has_many :reviews

  validates :name, presence: true, length: { maximum: 255 }

  before_create -> (airline) do
    airline.slug = airline.name.parameterize
  end

  # before_create :slugify !!! The one below doesn't work

  # def slugify
  #   airline.slug = airline.name.parameterize
  # end

  def avg_score
    reviews.average(:score).round(2).to_f
  end
end
