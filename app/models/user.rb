class User < ApplicationRecord
  
  has_many :wikis
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  after_initialize :init
  after_update :publicize
  
  def init
      self.role  ||= :standard  #will set the default value only if it's nil
  end
  
  def publicize
    if self.standard?
      self.wikis.update_all(private: false)
    end
  end

  enum role: [:standard, :admin, :premium]

end