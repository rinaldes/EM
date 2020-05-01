Rails.application.routes.draw do
  devise_for :users do
  # devise_for :users, controllers: { sessions: 'sessions',:passwords => 'passwords' } do
    authenticated :user do
      root :to => 'events#index'
      # get 'logout' => 'sessions#destroy'
    end
    unauthenticated :user do
      root :to => 'sessions#new'
    end
    # as :user do
    #   get 'registrations/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    #   put 'registrations/:id' => 'devise/registrations#update', :as => 'user_registration'
    # end
  end
  root :to => 'events#index'

  mount Ckeditor::Engine => '/ckeditor'
  resources :events do
    resource :agendas
    resources :agendas, only: [:destroy]
    resources :programmes, only: [:destroy]

    resource :attendees
    resources :attendees, only: [:destroy]

    resource :productions
    resources :productions, only: [:destroy]

    resource :realizations
    resources :realizations, only: [:destroy]

    resources :session_feedbacks
    get 'submit' => 'events#submit', :as => 'submit_event'
    resources :participants
    resources :sessions, only: [:index]
    resources :files, only: [:index, :create, :destroy]
    resources :messages, except: [:show] do
      member do
        get 'send_broadcast_message'
      end
    end
    resources :questions, only: [:index] do
      collection do
        get 'programmes'
        get 'change_status'
      end
    end
  end

  # resources :agendas
  resources :attendees#, only: [:destroy]
  get 'get_users' => 'attendees#get_users', :as => 'get_users'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # namespace :api do
  #   api version: 1, module: 'v1' do
  #     resources :sessions, only: [:create]
  #     #resources :members, only: [:index]
  #     resources :events, :defaults => { :format => 'json' }
  #   end
  # end

  api versions: 1, module: "api/v1" do
    resources :sessions, only: [:create]
    resources :events, only: [:index] do
      resources :agendas, only: [:index]
      resources :attendees, only: [:index, :show]
      resources :productions, only: [:index]
      resources :session_feedbacks, only: [:index]
      resources :accomodations, only: [:index]

      resources :files, only: [:index]
    resources :registrations#, only: [:index]
    end
    
    resources :programmes, only: [:show] do
      resources :session_feedbacks, only: [:create]
      resources :questions, only: [:index, :create] do
   member do
        post 'votes'
      end
      end
    end

    resources :registrations, only: [:index]
    resources :files, only: [:index]
    resources :users, only: [:update]
    resources :messages
  end
end
