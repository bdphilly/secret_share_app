class Tag < ActiveRecord::Base
	validates :name, presence: true

	has_many :secret_taggings
	has_many :secrets, through: :secret_taggings, source: :secret
end
