class Forums::Topic < ActiveRecord::Base
  # Belongs to
  belongs_to :forum 
  belongs_to :user
  
  # Has many/one
  has_many :posts, :dependent => :destroy
  has_one :post
  accepts_nested_attributes_for :post, :allow_destroy => true
  
  # Validations
  validates_presence_of :name 
  
  # Get the last posters username
  def most_recent_user
  	user = User.find(last_poster_id)
  	return user
  end
end
