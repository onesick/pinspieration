class Pin < ActiveRecord::Base
  belongs_to :board
  has_one :user, through: :boards
end
