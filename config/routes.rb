Jezmail::Engine.routes.draw do

  resources :envois
  resources :trash
  resources :draft
  resources :inbox


  match 'send', :to => 'envois#new', via: :all
  match 'messagessent', :to => 'envois#index', via: :all
  match 'trash', :to => 'trash#index', via: :all
  match 'draft', :to => 'draft#index', via: :all
  match 'inbox', :to => 'inbox#index',via: :all
  match 'repondre',:to => 'inbox#edit',via: :all



  root 'inbox#index'

end
