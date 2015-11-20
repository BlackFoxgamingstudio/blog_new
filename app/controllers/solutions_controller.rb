class SolutionsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def new
    @solution = Solution.new
  end
  
  def show
    @solution = Solution.find(params[:id])
    @idea = @solution.ideas.paginate(page: params[:page], per_page: 4)
  end
  
  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      flash[:success] = "Solution was created succesfully"
      redirect_to ideas_path
    else
      render 'new'
    end
  end
  
  private
  
  def solution_params
    params.require(:solution).permit(:name)
  end
  
end