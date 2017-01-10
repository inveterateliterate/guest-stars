class Appearance < ApplicationRecord
  belongs_to :guest_star
  belongs_to :series
end
