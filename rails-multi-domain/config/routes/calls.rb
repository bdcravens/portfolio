##############  CALLS  ###################

constraints subdomain: ['calls'] do

  scope module: 'calls' do

    resources :vendor1_disputes
    get '/' => 'dashboard#index', as: :calls_home
    post '/call_vendor1' => 'twilio#call_vendor1'
    post 'token/generate' => 'twilio#generate_token'
    post 'call/connect' => 'call#connect'

  end
end
