class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render :index
  end


  def show
    @team = Team.find(params[:id])
    # @team = Team.includes(:members).find(params[:id])
    render :show
  end


  def new
    @team = Team.new
    render :new
  end


  def edit
    @team = Team.find(params[:id])
    render :edit
  end


  def create
    @team = Team.new(params[:team])

    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      flash[:errors] = @team.errors.full_messages
      render :new
    end

  end


  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      flash[:errors] = @team.errors.full_messages
      render :new
    end
 end


  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    format.html { redirect_to teams_url }
  end
end
