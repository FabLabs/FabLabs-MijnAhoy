require 'rho/rhocontroller'

class NavbarController < Rho::RhoController


  def enable
    NavBar.create :title => "NavBar test", :left => {:action => :back, :label => 'Back'}, :right => {:action => '/app/Product', :label => "Product"}
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

=begin
  def set_toolbar
    toolbar = [
      {:action => :back,    :icon => '/public/images/bar/back_btn.png'},
      {:action => :forward, :icon => '/public/images/bar/forward_btn.png'},
      {:action => :separator},
      {:action => :home,    :icon => '/public/images/bar/home_btn.png'},
      {:action => :refresh },
      {:action => 'callback:' + url_for(:action => :callback), :label => 'Callback' },
      {:action => :options}
    ]
    NativeBar.create(Rho::RhoApplication::TOOLBAR_TYPE, toolbar)
    WebView.navigate @@this_page
  end
=end

end
