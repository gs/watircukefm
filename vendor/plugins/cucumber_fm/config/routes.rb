ActionController::Routing::Routes.draw do |map|
  map.namespace :documentation do |doc|
    doc.feature_show 'features/:id', :requirements => { :id => /.*[^(\/(edit|statistic))]/}, :conditions => { :method => :get },
    :controller => 'features',
    :action => 'show'
    doc.feature_update 'features/:id', :requirements => { :id => /.*[^(\/edit)]/}, :conditions => { :method => :post },
    :controller => 'features',
    :action => 'update'
    doc.feature_run 'features/:id', :conditions => {:method => "post"},
    :controller => 'features',
    :action => 'runme'       
                                                                                             
    doc.watircuke_results 'watircuke/results', :controller => 'watircuke', :action => 'results'
    
    doc.resources :features, :member => [:rename, :delete, :move], :collection => [:statistic]
    doc.resource :kanban, :controller => 'kanban'      
    doc.connect "assets/:path", :controller => 'assets', :action => 'get',
    :requirements => { :path => /.*/ }                                           

  end
end