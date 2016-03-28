class Topic < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true

  def get_category
    return self.category.name
  end

end
