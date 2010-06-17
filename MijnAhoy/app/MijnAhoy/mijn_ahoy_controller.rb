require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MijnAhoyController < Rho::RhoController
  include BrowserHelper

  #GET /MijnAhoy
  def index
    @mijnahoys = MijnAhoy.find(:all)
    render
  end

  # GET /MijnAhoy/{1}
  def show
    @mijnahoy = MijnAhoy.find(@params['id'])
    if @mijnahoy
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /MijnAhoy/new
  def new
    @mijnahoy = MijnAhoy.new
    render :action => :new
  end

  # GET /MijnAhoy/{1}/edit
  def edit
    @mijnahoy = MijnAhoy.find(@params['id'])
    if @mijnahoy
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /MijnAhoy/create
  def create
    @mijnahoy = MijnAhoy.new(@params['mijnahoy'])
    @mijnahoy.save
    redirect :action => :index
  end

  # POST /MijnAhoy/{1}/update
  def update
    @mijnahoy = MijnAhoy.find(@params['id'])
    @mijnahoy.update_attributes(@params['mijnahoy']) if @mijnahoy
    redirect :action => :index
  end

  # POST /MijnAhoy/{1}/delete
  def delete
    @mijnahoy = MijnAhoy.find(@params['id'])
    @mijnahoy.destroy if @mijnahoy
    redirect :action => :index
  end
end
