class Wiki < ApplicationRecord
  
  belongs_to :user
  
  scope :free, -> { where( private: false) }
  
  after_initialize :make_private
  
  def make_private
      self.private  ||= false  #will set the default value only if it's nil
  end
  
end
