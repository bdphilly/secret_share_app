class SecretTagging < ActiveRecord::Base
	validates :secret_id, :tag_id, presence: true
	validates :tag_id, :uniqueness => { :scope => :secret_id }

	belongs_to :tag
	belongs_to :secret
end
