class Book < ActiveRecord::Base
	validates :url, presence: true, uniqueness: true
	validates :title, presence: true
	validates :price_initial, presence: true
	validates :price_current, presence: true
	validates :isbn, presence: true, uniqueness: true

	validates_format_of :url, :with => URI::regexp(%w(http https))
end
