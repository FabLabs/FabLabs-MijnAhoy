require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
      # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    @tabs = [
      { :label => "Index", :action => '/app', :icon => "/public/images/tabs/index-icon.png", :reload => true },
	  { :label => "Evenement", :action => '/app/Product',  :icon => "/public/images/tabs/evenement-icon.png" }, 
      { :label => "Beurs",  :action => '/app/Product',  :icon => "/public/images/tabs/beurs-icon.png" },
      { :label => "Muziek",  :action => '/app/Product',  :icon => "/public/images/tabs/muziek-icon.png" },
      { :label => "Info",   :action => '/app/Product', :icon => "/public/images/tabs/info-icon.png" }
    ]

    @@tabbar = nil
    # Important to call super _after_ you define @tabs!
    super
  end
end
