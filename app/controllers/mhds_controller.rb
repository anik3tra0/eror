class MhdsController < ApplicationController
before_action :find_mhd, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @mhd = current_user.mhds.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      @mhd = Mhd.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    end
  end

  def new
    @mhd = current_user.mhds.build
  end

  def create
    @mhd = current_user.mhds.build mhd_params
    if @mhd.save
      redirect_to @mhd, notice: "Your method has been saved!"
    else
      render 'new', notice: "Houston, We have a problem! Your method was not saved."
    end
  end

  def all
    if user_signed_in?
      @mhds_all = Mhd.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      redirect_to '/'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mhd.update mhd_params
      redirect_to @mhd, notice: "Your method has been updated and saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @mhd.destroy
    redirect_to root_path
  end

  private

  def mhd_params
    params.require(:mhd).permit(:name, :mtype, :value, :description)
  end

  def find_mhd
    @mhd = Mhd.find(params[:id])
  end
end
