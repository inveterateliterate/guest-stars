class Series < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_many :appearances, dependent: :destroy
end
