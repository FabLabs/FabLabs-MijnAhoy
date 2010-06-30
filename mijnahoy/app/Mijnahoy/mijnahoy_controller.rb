require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MijnahoyController < Rho::RhoController
  include BrowserHelper

  #GET /Mijnahoy
  def index
    @mijnahoys = Mijnahoy.find(:all)
    render
  end

  # GET /Mijnahoy/{1}
  def show
    @mijnahoy = Mijnahoy.find(@params['id'])
    if @mijnahoy
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Mijnahoy/new
  def new
    @mijnahoy = Mijnahoy.new
    render :action => :new
  end

  # GET /Mijnahoy/{1}/edit
  def edit
    @mijnahoy = Mijnahoy.find(@params['id'])
    if @mijnahoy
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Mijnahoy/create
  def create
    @mijnahoy = Mijnahoy.new(@params['mijnahoy'])
    @mijnahoy.save
    redirect :action => :index
  end

  # POST /Mijnahoy/{1}/update
  def update
    @mijnahoy = Mijnahoy.find(@params['id'])
    @mijnahoy.update_attributes(@params['mijnahoy']) if @mijnahoy
    redirect :action => :index
  end

  # POST /Mijnahoy/{1}/delete
  def delete
    @mijnahoy = Mijnahoy.find(@params['id'])
    @mijnahoy.destroy if @mijnahoy
    redirect :action => :index
  end

#GET /cover
  def cover
	render :action => :cover
  end


end
