class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])

    render :show
  end

  def new
    @item = Item.new
    @projects = Project.all
    render :new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to project_item_url(params[:item][:project_id], @item.id)
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to new_project_item_url(params[:item][:project_id])
    end
  end

  def edit
    @item = Item.find(params[:id])
    @projects = Project.all
    render :edit
  end


  def update
    @item = Item.find(params[:id])
    @project = Project.find(params[:item][:project_id])

    if @item.update_attributes(params[:item])
      redirect_to project_item_url(@project.id, @item.id)
    else
      flash[:errors] = @item.errors.full_messages

      render :new
    end

  end

  def index
    @items = Item.includes(:project).all
  end

end
