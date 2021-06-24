class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user

  def tag_ids=(ids)
    ids.each do |id| 
      if !id.strip.empty? then 
        self.tags << Tag.find_by(id: id)
      end
    end
  end

  def tag_ids
    self.tags.nil? ? nil? : self.tags.map {|tag| tag.id}
  end

  validates :name, presence: true
  validates :content, presence: true
end