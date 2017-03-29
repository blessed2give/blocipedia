class CollaborationsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    user = User.find(params[:user_id])
    if Collaboration.create(user: user, wiki: @wiki)
      redirect_to @wiki, notice: 'Collaborator added.'
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    user = User.find(params[:user_id])
    collaboration = Collaboration.find_by(user: user, wiki: @wiki)
    if collaboration.destroy
      redirect_to @wiki, notice: 'Collaborator deleted.'
    end
  end
end
