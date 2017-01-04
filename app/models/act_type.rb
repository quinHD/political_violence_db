class ActType < ApplicationRecord
  has_and_belongs_to_many :acts
  validates :name, presence: true
  validates :name, uniqueness: true, allow_blank: false
end
