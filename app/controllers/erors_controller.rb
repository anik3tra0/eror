class ErorsController < ApplicationController
  before_action :find_eror, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @eror = current_user.erors.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      @eror = Eror.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    end    
  end

  def new
    @eror = current_user.erors.build
  end

  def create
    @eror = current_user.erors.build eror_params
    if @eror.save
      redirect_to @eror, notice: "Your error has been logged!"
    else
      render 'new', "Houston, We have a problem! Your error was not logged."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @eror.update eror_params
      redirect_to @eror, notice: "Your error has been updated and saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @eror.destroy
    redirect_to root_path
  end

  private

  def eror_params
    params.require(:eror).permit(:name, :description, :cause, :fix)
  end

  def find_eror
    @eror = Eror.find(params[:id])
  end
end
