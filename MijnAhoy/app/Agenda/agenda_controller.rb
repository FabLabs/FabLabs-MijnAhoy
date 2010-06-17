require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AgendaController < Rho::RhoController
  include BrowserHelper

  #GET /Agenda
  def index
    @agendas = Agenda.find(:all)
    render
  end

  # GET /Agenda/{1}
  def show
    @agenda = Agenda.find(@params['id'])
    if @agenda
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Agenda/new
  def new
    @agenda = Agenda.new
    render :action => :new
  end

  # GET /Agenda/{1}/edit
  def edit
    @agenda = Agenda.find(@params['id'])
    if @agenda
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Agenda/create
  def create
    @agenda = Agenda.new(@params['agenda'])
    @agenda.save
    redirect :action => :index
  end

  # POST /Agenda/{1}/update
  def update
    @agenda = Agenda.find(@params['id'])
    @agenda.update_attributes(@params['agenda']) if @agenda
    redirect :action => :index
  end

  # POST /Agenda/{1}/delete
  def delete
    @agenda = Agenda.find(@params['id'])
    @agenda.destroy if @agenda
    redirect :action => :index
  end
end
