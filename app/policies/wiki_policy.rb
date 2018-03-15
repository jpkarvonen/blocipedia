class WikiPolicy < ApplicationPolicy
    
  def update?
    user.present?
  end
  
  def destroy? 
    user.admin? or user == record.user
  end
  
end