class SubsController < ApplicationController

  before_action :require_moderator_status, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to subs_url
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    render :edit
  end

  def update
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator_status
    @sub = Sub.find(params[:id])
    redirect_to subs_url unless @sub.moderator_id == current_user.id
  end

end
