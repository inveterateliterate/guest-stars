class GuestStar < ApplicationRecord
  has_many :appearances, dependent: :destroy
end
