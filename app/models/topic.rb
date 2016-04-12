class Topic < ActiveRecord::Base
  belongs_to :category
  validates :name, :category_id, presence: true

  def get_category
    return self.category.name
  end

end
