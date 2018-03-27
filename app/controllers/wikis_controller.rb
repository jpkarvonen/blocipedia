class WikisController < ApplicationController
  def index
     @wikis = policy_scope(Wiki)
  end

  def show
   @wiki = Wiki.find(params[:id])
   @collaborator = Collaborator.new
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new
    @wiki.assign_attributes(wiki_params)
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @collaborator = Collaborator.new
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.assign_attributes(wiki_params)
 
    if @wiki.save
      flash[:notice] = "Wiki was updated!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    end
  end
  
  private
  def wiki_params
    if current_user.admin? || current_user.premium? || wiki.collaborator_user_ids.include?(current_user)
      params.require(:wiki).permit(:title, :body, :private, :collaborator_user_ids)
    else
      params.require(:wiki).permit(:title, :body)
    end
  end
end



