class Category < ActiveRecord::Base

  has_many :topics, dependent: :destroy
  
  validates :name, :category_id, presence: true

#  def self.get_all_categories
#    self.all
#  end

end
