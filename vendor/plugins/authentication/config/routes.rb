ActionController::Routing::Routes.draw do |map|

  map.resource :session
  map.resources :users, :only => [:new, :create], :collection => {:forgot => :get, :reset => :get}
  map.reset_users '/users/reset/:reset_code', :controller => 'users', :action => 'reset'

  map.with_options(:path_prefix => "refinery", :name_prefix => "admin_", :namespace => "admin/") do |admin|
    admin.resources :users
  end

  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

end
