require 'rho/rhoapplication'


class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
      # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    @tabs = [
      { :label => "Mijn Ahoy", :action => '/app/MijnAhoy', :icon => "/public/images/tabs/ahoy-icon.png", :reload => true },
	  { :label => "Agenda", :action => '/app/Agenda',  :icon => "/public/images/tabs/agenda-icon.png" }, 
      { :label => "Prijsvraag",  :action => '/app/Prijsvraag',  :icon => "/public/images/tabs/prijsvraag-icon.png" },
      { :label => "Info",  :action => '/app/Info',  :icon => "/public/images/tabs/info-icon.png" },
    ]

    @@tabbar = nil
    # Important to call super _after_ you define @tabs!
    super
	# NavBar.create :title => "Index", :left => {:action => :back, :label => 'Index'}, :right => {:action => '/app/Product', :label => "Info"}
  end
end



