class CollaboratorsController < ApplicationController
  
  def create
    @wiki = Wiki.find(params[:wiki_id])
    email = params[:email]
    @user = User.find_by email: email
    
    if (@user == nil)
      flash[:alert] = "User could not be found"
      redirect_to edit_wiki_path(@wiki)
    elsif (@wiki.user == @user)
      flash[:alert] = "You are the user with that email"
      redirect_to edit_wiki_path(@wiki)
    elsif (@wiki.users.include?(@user))
      flash[:alert] = "The user with that email is already a collaborator"
      redirect_to edit_wiki_path(@wiki)
    else
      @collaborator = Collaborator.new(user_id: @user.id, wiki_id: @wiki.id)
    
      if @collaborator.save
        flash[:notice] = "Collaborator was saved."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:error] = "Error. Could not save the collaborator."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @collaborator = Collaborator.find_by(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was successfully removed."
      redirect_to wiki_path(@collaborator.wiki)
    else
      flash[:error] = "There was an error removing the collaborator. Please try again."
      redirect_to edit_wiki_path(@collaborator.wiki)
    end
  end

end
