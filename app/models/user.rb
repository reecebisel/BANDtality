class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :profile, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :photos, dependent: :destroy 

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
