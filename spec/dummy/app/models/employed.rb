class Employed < ActiveRecord::Base
  belongs_to :company

  def self.by_name(name)
  	where(name: name)
  end

  def self.age(age)
  	where(age: name)
  end
end
