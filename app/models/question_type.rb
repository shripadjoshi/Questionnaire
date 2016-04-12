class QuestionType < ActiveRecord::Base
  validates :name, presence: true
end
