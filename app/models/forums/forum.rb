class Forums::Forum < ActiveRecord::Base
  belongs_to :category
  has_many :topics, :dependent => :destroy 
  has_many :posts, :through => :topics
  belongs_to :user
  
  def most_recent_post  
    topic = Forums::Topic.first(:order => 'last_post_at DESC', :conditions => ['forum_id = ?', self.id])  
    return topic  
  end
  
  def most_recent_user
  	user = User.find(most_recent_post.last_poster_id)
  	return user
  end
end
