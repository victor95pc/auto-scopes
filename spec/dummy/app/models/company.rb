class Company < ActiveRecord::Base
  belongs_to :ceo
  has_many :employeds

  def self.type(type)
  	where(type: type)
  end
end
