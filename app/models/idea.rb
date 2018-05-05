class Idea < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :category_ideas, dependent: :destroy
  has_many :categories, through: :category_ideas
  has_many :comments, dependent: :destroy

  def show_categories
    categories = self.categories
    text = ""
    categories.each do |category|
      text += "#{category.name} "
    end
    return text
  end

  def to_param
    "#{self.id}-#{self.title.try(:parameterize)}"
  end

  def total_likes
    likes = Like.where(idea_id: self.id).count
    return likes
  end

  def total_comments
    comments = Comment.where(idea_id: self.id).count
    return comments
  end

  def url
    url = "request.protocol"
    return url
  end

end
