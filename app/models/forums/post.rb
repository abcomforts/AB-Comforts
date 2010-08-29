class Forums::Post < ActiveRecord::Base
  # Setup
  belongs_to :topic, :foreign_key => 'topic_id'
  belongs_to :user 
  
  # Validations
  validates_presence_of :content 
  
end
