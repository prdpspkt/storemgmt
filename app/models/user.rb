class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable,  :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :lockable

  has_one :office, class_name: "Office::Office"
  has_many :personnels, class_name: "Office::Personnel"
  has_one :setup
end
