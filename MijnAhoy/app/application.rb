require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    @tabs = [
      { :label => "Mijn Ahoy", :action => '/app/Mijnahoy', :icon => "/public/images/tabs/ahoy-icon.png", },
	  { :label => "Agenda", :action => '/app/Agenda',  :icon => "/public/images/tabs/agenda-icon.png" }, 

    ]

    @@tabbar = nil
    # Important to call super _after_ you define @tabs!
    super
  end
end
