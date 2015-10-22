class ConventionsController < ApplicationController
  before_action :find_convention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @convention = current_user.conventions.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      @convention = Convention.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    end
  end

  def new
    @convention = current_user.conventions.build
  end

  def create
    @convention = current_user.conventions.build convention_params
    if @convention.save
      redirect_to @convention, notice: "Your convention has been saved!"
    else
      render 'new', notice: "Houston, We have a problem! Your convention was not saved."
    end
  end

  def all
    if user_signed_in?
      @conv_all = Convention.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      redirect_to '/'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @convention.update convention_params
      redirect_to @convention, notice: "Your convention has been updated and saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @command.destroy
    redirect_to root_path
  end

  private

  def convention_params
    params.require(:convention).permit(:ctlr, :action, :views, :uri, :description)
  end

  def find_convention
    @convention = Convention.find(params[:id])
  end
end
