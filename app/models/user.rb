class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_one_attached :avatar

  has_many :projects, :dependent => :destroy

  validates :linkedin_url, url: { host: /linkedin\.com\z/ }
  validates :github_url, url: { host: /github\.com\z/}
  validates :twitter_url, url: { host: /twitter\.com\z/}

  def purge_avatar=(arg=true)
    self.avatar.purge
  end
end
