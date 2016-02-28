Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  post "headshot/capture" => 'headshot#capture', :as => :headshot_capture
  post 'equipment/search'
  get 'equipment/search'
  get '/takeashot' => 'equipment#takeashot'
  post '/takeashot' => 'equipment#takeashot'
  get '/contact' => 'welcome#contact'
  get '/about' => 'welcome#about'
  post 'equipment/advance'
  get 'equipment/advance'
  post 'equipment/info'
  get 'equipment/info'
  get 'equipment/audit'
  post 'equipment/audit'
  get 'welcome/index'
  post 'welcome/index'
  get 'equipment/reserved'
  post 'equipment/reserved'
  get 'equipment/approve'
  post 'equipment/approve'
  get 'equipment/decoder'
  post 'equipment/decoder'
  get 'equipment/doReserve'
  post 'equipment/doReserve'
  get 'equipment/reset'
  post 'equipment/cancel'
  get 'equipment/cancel'
  get 'equipment/saveimage'
  post 'equipment/saveimage'
  get 'equipment/showimage'
  post 'equipment/showimage'
  get 'equipment/upload'
  post 'equipment/upload'
  get 'equipment/return'
  post 'equipment/return'

  resources :articles do 
    resources :comments
  end

  root 'welcome#index'


end

  