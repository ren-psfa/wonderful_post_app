class Article < ApplicationRecord
  validates :title, :content,  presence: true
  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  # def save_tag(sent_tags)
  #   current_tags = self.tags.pluck(:name) unless self.tags.nil?
  #   old_tags = current_tags - sent_tags
  #   new_tags = sent_tags - current_tags

  #   old_tags.each do |old|
  #     self.tags.delete Tag.find_by(name: old)
  #   end

  #   new_tags each do |new|
  #     new_article_tag = Tag.find_or_create_by(name: new)
  #     self.article_tags << new_article_tag
  #   end
  # end
end
