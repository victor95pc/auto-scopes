class Ceo < ActiveRecord::Base
	has_many :companies

	def self.boss_name(name)
  	where(name: name)
  end
end
