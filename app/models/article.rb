class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  # Initially it ised to be like
  # tags = article.taggings.collect{|tagging| tagging.tag}
  # Which is PAIN!! BUt we have the 'through' keyword that assists us
  has_many :tags, through: :taggings
  # This lists the tags
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
  def tag_list=(tags_string)
  end
end
