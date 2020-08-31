# constraints subdomain: ['account','account.staging'] do
#   #get '/' => 'customer_dashboard#index', as: :customer_home
#   # get '/' => 'welcome#index', as: :customer_home
# end

# Example of regular route:
#   get 'products/:id' => 'catalog#view'


##############  CUSTOMERS  ###################

# if this gets much more complex, convert to class
# see http://guides.rubyonrails.org/routing.html#advanced-constraints

constraints(lambda {|request|
  ['client', 'customers', 'customers-staging', 'partners', 'demo', ENV['NGROK_SUBDOMAIN']].include?(request.subdomain)
}) do
  # Dashboard pages and JSON endpoints
  get '/' => 'customers/dashboard#index', as: :customer_home
  post '/' => 'customers/dashboard#index', as: :customer_home_dateupdate
  get 'dashboard/dispute_activity' => 'customers/dashboard#dispute_activity'
  get 'dashboard/account_activity' => 'customers/dashboard#account_activity'
  get 'dashboard/shipping_activity' => 'customers/dashboard#shipping_activity'
  get 'dashboard/billing_links' => 'customers/dashboard#billing_links'
  get 'dashboard/money_saved' => 'customers/dashboard#money_saved'
  get 'dashboard/packages_processed' => 'customers/dashboard#packages_processed'
  get 'dashboard/refund_rate' => 'customers/dashboard#refund_rate'
  get 'dashboard/time_saved' => 'customers/dashboard#time_saved'
  get 'dashboard/invoices_processed' => 'customers/dashboard#invoices_processed'

  # reports framework
  get 'reports/' => 'customer_reports#index', as: :customer_reports
  post 'reports/update' => 'customer_reports#update', as: :customer_reports_filter
  get 'reports/:report_name' => 'customer_reports#show', as: :customer_report_display

  scope module: 'customers' do

    get 'billing/payment_dropdown' => 'billing#payment_dropdown'

    resources :billing, only: [:index, :show]
    resources :carrier_accounts do
      resources :carrier_invoices
    end

    resources :payment_profiles

    post 'autopay_flag' => 'autopay_flag#update', as: :autopay_flag
    post 'paper_flag' => 'paper_flag#update', as: :paper_flag

    resources :carrier_invoices
    resources :package, only: [:show]
    resources :partners, only: [:index], as: :customer_partners
    resources :company, only: [:show, :update], as: :customer_company
    #resources :paypal_payments
    resources :transactions, only: [:index, :show]

    resources :announcements, only: [:index]
    resources :announcement_notifications, only: [:create]

    get 'paypal_payments/new/:invoices' => 'paypal_payments#new', as: :new_paypal_payment
    post 'paypal_payments/hook' => 'paypal_payments#hook'
    #post 'paypal_payments/:id' => 'paypal_payments#show', as: :paypal_payment_response
    get 'paypal_payments/:id' => 'paypal_payments#show', as: :paypal_payment_response

    get 'credit_card_payments' => 'credit_card_payments#index', as: :credit_card_payments_index
    get 'credit_card_payments/new' => 'credit_card_payments#new', as: :new_credit_card_payment

    # search page and JSON endpoints
    get 'search' => 'search#index'
    get 'search/packages' => 'search#packages'
    get 'search/invoices' => 'search#invoices'
    get 'search/disputes' => 'search#disputes'
    get 'search/billing' => 'search#billing'

    get 'admin/become/:id' => 'admin#become', as: :login_as
  end
end
