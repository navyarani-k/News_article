class Article < ApplicationRecord
	scope :article_created_date, -> { where(created_at:Time.now.beginning_of_day-10.day..Time.now-10.days) }
	has_many :comments


	validates :headline , presence: true
	before_save :generate_friendly_id
	private 
	  def generate_friendly_id
	  	self.friendly_id = self.headline.downcase.gsub(/\s/,'-')
	  end
end
