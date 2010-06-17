require 'rho/rhocontroller'

class NavbarController < Rho::RhoController

  @@this_page = '/app/Navbar'

  def enable
    NavBar.create :title => "NavBar test", :left => {:action => :back, :label => 'Back'}, :right => {:action => '/app/NativeBarTest', :label => "NativeBar"}
    render :action => :index
  end

  def enable1
    NavBar.create :title => "NavBar test", :left => {:action => :back, :lable => 'Back'}
    render :action => :index
  end

  def disable
    NavBar.remove
    render :action => :index
  end

end
