class Idea < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :category_ideas
  has_many :categories, through: :category_ideas

  def show_categories
    categories = self.categories
    text = ""
    categories.each do |category|
      text += "#{category.name} "
    end
    return text
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def total_likes
    likes = Like.where(idea_id: self.id).count
    return likes
  end

end
