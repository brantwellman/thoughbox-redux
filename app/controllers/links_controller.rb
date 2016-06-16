class LinksController < ApplicationController
  before_action :unauthenticated_user

  def index
    @link = Link.new
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link
    else
      flash[:errors] = @link.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private

    def link_params
      params.require(:link).permit(:url, :title, :read)
    end
end
