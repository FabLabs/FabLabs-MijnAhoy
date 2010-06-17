require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PrijsvraagController < Rho::RhoController
  include BrowserHelper

  #GET /Prijsvraag
  def index
    @prijsvraags = Prijsvraag.find(:all)
    render
  end

  # GET /Prijsvraag/{1}
  def show
    @prijsvraag = Prijsvraag.find(@params['id'])
    if @prijsvraag
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Prijsvraag/new
  def new
    @prijsvraag = Prijsvraag.new
    render :action => :new
  end

  # GET /Prijsvraag/{1}/edit
  def edit
    @prijsvraag = Prijsvraag.find(@params['id'])
    if @prijsvraag
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Prijsvraag/create
  def create
    @prijsvraag = Prijsvraag.new(@params['prijsvraag'])
    @prijsvraag.save
    redirect :action => :index
  end

  # POST /Prijsvraag/{1}/update
  def update
    @prijsvraag = Prijsvraag.find(@params['id'])
    @prijsvraag.update_attributes(@params['prijsvraag']) if @prijsvraag
    redirect :action => :index
  end

  # POST /Prijsvraag/{1}/delete
  def delete
    @prijsvraag = Prijsvraag.find(@params['id'])
    @prijsvraag.destroy if @prijsvraag
    redirect :action => :index
  end
end
