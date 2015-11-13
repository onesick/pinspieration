class User < ActiveRecord::Base
  def username
    self.email.split("@")[0]
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :boards
  has_many :pins, through: :boards
end
