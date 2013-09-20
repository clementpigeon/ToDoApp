class ProjectsController < ApplicationController


  def index
    @projects = Project.all

    render :index
  end



  def show
    @project = Project.find(params[:id])

    render :show
  end



  def new
    @project = Project.new
    @teams = []

    render :new
  end



  def edit
    @project = Project.find(params[:id])

    render :edit
  end



  def create
    @project = Project.new(params[:project])

    # render json: params

    if @project.save
      redirect_to @project
    else
      flash[:errors] = @project.errors.full_messages
      redirect_to new_project_url
    end

  end



  def update
    @project = Project.find(params[:id])

    if @project.save
      redirect_to @project
    else
      flash.now[:errors] = @project.errors.full_messages
      render :edit
    end

  end



  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url

  end

end
