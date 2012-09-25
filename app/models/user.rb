class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :provider, :uid

  validates_presence_of :first_name, :last_name, :uid
  validates_uniqueness_of :uid

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    self.full_name
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
    end
  end

end
