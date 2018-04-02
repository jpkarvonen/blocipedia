class User < ApplicationRecord
  
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :collaborator_wikis, through: :collaborators, :source => :wiki
  
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  scope :all_except, -> (user, wiki){ where.not(id: user) }
  scope :exclude_collaborators, -> (wiki){where.not(id: wiki.users)}       
         
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