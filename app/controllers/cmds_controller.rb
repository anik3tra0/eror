class CmdsController < ApplicationController
  before_action :find_command, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :all]
  
  def index
    if user_signed_in?
      @command = current_user.cmds.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      @command = Cmd.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    end
  end

  def new
    @command = current_user.cmds.build
  end

  def create
    @command = current_user.cmds.build command_params
      if @command.save
        redirect_to @command, notice: "Your command has been saved!"
      else
        render 'new', notice: "Houston, We have a problem! You command was not saved"
      end
  end

  def all
    if user_signed_in?
      @cmd_all = Cmd.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    else
      redirect_to '/'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @command.update command_params
      redirect_to @command, notice:  "Your command has been updated and saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @command.destroy
    redirect_to root_path
  end


  private

  def command_params
    params.require(:cmd).permit(:name, :option, :description)
  end

  def find_command
    @command = Cmd.find(params[:id])
  end

end
