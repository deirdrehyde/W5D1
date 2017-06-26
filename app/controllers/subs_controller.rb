class SubsController < ApplicationController

  before_action :require_moderator_status

  def new
  end

  def index
    @subs = Sub.all
  end

  def create
    sub = Sub.new(sub_params)
    sub.moderator = current_user.id
    if sub.save
      redirect_to subs_url(sub)
    else
      flash[:errors] = sub.errors.full_messages
      redirect_to subs_url
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
