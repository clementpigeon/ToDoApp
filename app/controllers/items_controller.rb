class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])

    render :show
  end

  def new
    @item = Item.new
    @project = Project.find(params[:project_id])
    render :new
  end

  def create
    @item = Item.new(params[:item])
    @project = Project.find(params[:item][:project_id])
    if @item.save
      redirect_to project_item_url(@project.id, @item.id)
    else
      flash[:errors] = @item.errors.full_messages

      render :new
    end

  end


end
