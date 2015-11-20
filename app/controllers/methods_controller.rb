class MethodsController < ApplicationController
  before_action :set_method, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index, :like]
  before_action :require_same_user, only: [:edit, :update]
  

  def index
    @methods = Method.paginate(page: params[:page], per_page: 4)
  end
  
  def show
     
  end
  
  def new
    @method = Method.new
  end
  
  def create
    @method = Method.new(method_params)
    @method.marketer = current_user
    
    if @method.save
      flash[:success] = "Your method was created succesfully!"
      redirect_to methods_path
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def goals
    
  end
  
  def update
    if @method.update(method_params)
      flash[:success] = "Your method was updated succesfully!"
      redirect_to method_path(@method)
    else
      render :edit
    end
  end
  
  def like
    like = Like.create(like: params[:like], marketer: current_user, method: @method)
    if like.valid?
      flash[:success] = "Your selection was succesful"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a method once"
      redirect_to :back
    end
  end
  
  def destroy
    Method.find(params[:id]).destroy
    flash[:success] = "Method Deleted"
    redirect_to methods_path
  end
  
  private
  
    def method_params
      params.require(:method).permit(:name, :summary, :description, :picture, solution_ids:[], vertical_ids:[])
    end
    
    def set_method
      @method = Method.find(params[:id])
    end
    
    def require_same_user
      if current_user != @method.marketer and !current_user.admin?
        flash[:danger] = "You can only edit your own methods"
        redirect_to methods_path
      end
    end
  
  def require_user_like
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to :back
    end
  end
  
  
  def admin_user
      redirect_to methods_path unless current_user.admin?
  end
  
end