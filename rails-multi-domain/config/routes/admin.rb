##############  ADMIN  ###################

require 'sidekiq/pro/web'
require 'sidekiq/cron/web'

constraints subdomain: ['admin','admin.staging'] do

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/workers'
  end

  root 'admin_dashboard#index'

  resources :full_crud_route1
  resources :full_crud_route2

  scope module: 'admin' do
    namespace :processing do
      get 'vendor1/' => 'vendor1#index', as: :vendor1_customers
      post 'vendor1/customer_batch' => 'vendor1#launch_batch', as: :vendor1_customer_launch_batch
    end
    namespace :vendor1 do
      namespace :disputes do
        get 'public_disputes/' => 'public_disputes#index', as: :public
      end
    end
  end  

end