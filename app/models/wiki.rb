class Wiki < ApplicationRecord
  
  belongs_to :user
  has_many :collaborators
  has_many :collaborator_users, through: :collaborators, :source => :user 
  
  after_initialize :make_private
  
 
  private
  def make_private
      self.private  ||= false  #will set the default value only if it's nil
  end
  
end
