class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags)
    tags.each do |i, tag_hash|
      self.tags.build(name: tag_hash[:name]) if tag_hash[:name].present?
    end
  end
end
