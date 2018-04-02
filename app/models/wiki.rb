class Wiki < ApplicationRecord
  
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators
  
  after_initialize :make_private
  
 
  private
  scope :free, -> { where( private: false) }
  
  after_initialize :make_private
  
  def make_private
      self.private  ||= false  #will set the default value only if it's nil
  end
  
end
