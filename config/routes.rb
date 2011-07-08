Tview::Application.routes.draw do
  get "usershow/index"
  post "usershow/tview"
  post "usershow/changetemplate"  
  get "usershow/downloadtemplate"
  post "usershow/tagname"
  post "usershow/otherhtml"

  match '/admin' => 'admin/admins#index', :as => :admin
  namespace :admin do
    resources :admins, :except => [:index, :show]
    resources :template, :except => [:edit, :update]
    get "statsfull/show"
    post "statsfull/rules_config"
    get "statsfull/index"   
    get "statsfull/small"
    get "statsfull/top_downloaded"
  end

  devise_for :auths, :skip => :registrations, :controllers => {:sessions => "admin/sessions"}
  root :to => "usershow#index"  
  match '*a', :to => 'errors#routing'
end