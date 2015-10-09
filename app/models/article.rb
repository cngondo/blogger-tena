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
  # Method for splitting the tag names
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
