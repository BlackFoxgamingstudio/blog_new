class VerticalsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def new
    @vertical = Vertical.new
  end
  
  def show
    @vertical = Vertical.find(params[:id])
    @idea = @vertical.ideas.paginate(page: params[:page], per_page: 4)
  end
  
  def create
    @vertical = Vertical.new(vertical_params)
    if @vertical.save
      flash[:success] = "Vertical was created succesfully"
      redirect_to ideas_path
    else
      render 'new'
    end
  end
  
  private
  
  def vertical_params
    params.require(:vertical).permit(:name)
  end
  
end