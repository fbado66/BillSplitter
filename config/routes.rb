Rails.application.routes.draw do
  get 'profiles/index'
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/delete'
  get 'profiles/create'
  get 'profiles/update'
  get 'photo/index'
  get 'photo/create'
  get 'photo/new'
  get 'photo/edit'
  get 'photo/update'
  get 'photo/destroy'
  devise_for :views
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bills
  resources :bills_items
  resources :group_bills
  resources :users_bills
  resources :items
  resources :users
  resources :photos
  resources :profiles

  
devise_scope :user do
  authenticated :user do
    root 'group_bills#new', as: :authenticated_root
  end
  
  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

end
