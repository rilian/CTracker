class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :omniauthable
  # :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :recoverable,  :validatable
  # attr_accessible :title, :body
end
