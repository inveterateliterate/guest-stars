class GuestStar < ApplicationRecord
  has_many :appearances, dependent: :destroy

  # validates_presence_of :name, :image
end
