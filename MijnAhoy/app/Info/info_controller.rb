require 'rho/rhocontroller'
require 'helpers/browser_helper'

class InfoController < Rho::RhoController
  include BrowserHelper

  #GET /Info
  def index
    @infos = Info.find(:all)
    render
  end

  # GET /Info/{1}
  def show
    @info = Info.find(@params['id'])
    if @info
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Info/new
  def new
    @info = Info.new
    render :action => :new
  end

  # GET /Info/{1}/edit
  def edit
    @info = Info.find(@params['id'])
    if @info
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Info/create
  def create
    @info = Info.new(@params['info'])
    @info.save
    redirect :action => :index
  end

  # POST /Info/{1}/update
  def update
    @info = Info.find(@params['id'])
    @info.update_attributes(@params['info']) if @info
    redirect :action => :index
  end

  # POST /Info/{1}/delete
  def delete
    @info = Info.find(@params['id'])
    @info.destroy if @info
    redirect :action => :index
  end
end
