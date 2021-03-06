class Room < ApplicationRecord
  has_many :bookings, :dependent => :destroy
  has_many :items_rooms
  has_many :items, through: :items_rooms
  has_many :reviews, through: :bookings
  has_one_attached :photo
  belongs_to :studio


  include PgSearch::Model
  pg_search_scope :global_search,
                  associated_against: {
                  items: [:name]
                  },
                  using: {
                  tsearch: { prefix: true } }
end
