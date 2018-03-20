class User < ApplicationRecord
  
  has_many :wikis
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  after_initialize :init
  
  def init
      self.role  ||= :standard  #will set the default value only if it's nil
  end

  enum role: [:standard, :admin, :premium]

end