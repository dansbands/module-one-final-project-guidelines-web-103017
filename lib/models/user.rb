class User < ActiveRecord::Base
  has_many :songs
  has_many :setlists

  def find_by_name(name)
    self.all.select do |user|
      user.name == name 
    end
  end
end
