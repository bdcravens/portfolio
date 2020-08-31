class ZohoGateway::OutsourcedAccounts

  def list(from_index=0, page_size=200, access_token=nil)

    url = "https://www.zohoapis.com/crm/v2/coql"
    authorization = "Zoho-oauthtoken #{access_token}"
    payload = { 'select_query'=>coql(from_index, page_size) }
    access_token ||= generate_access_token
    headers = {content_type: :json, Authorization: "Zoho-oauthtoken #{access_token}"}
    response = JSON.parse(RestClient.post(url, payload.to_json, headers))    
    accounts = []

    accounts = response['data'].map do |record|
      if record['Account_Type']=='Acme'
        {
          account_number: record['Name'],
          company_name: record['Billing_Name'],
          address: record['Billing_Address'],
          city: record['Billing_City'],
          state: record['Billing_State'],
          zip: record['Billing_Zip']
        }
      end
    end

    if response['info']['more_records']
      accounts << list(from_index+page_size, page_size, access_token)
    end 
    
    accounts.flatten

  end

  def generate_access_token     
    params = {
      grant_type: 'refresh_token',
      client_id: ENV['ZOHO_CRM_CLIENT_ID'],
      client_secret: ENV['ZOHO_CRM_CLIENT_SECRET'],
      refresh_token: ENV['ZOHO_CRM_REFRESH_TOKEN']
    }
    url = "https://accounts.zoho.com/oauth/v2/token?#{params.to_query}"
    response = JSON.parse(RestClient.post(url,{}))
    response['access_token']
  end

  private

  def coql(from_index, page_size)
    "select Account_Type, Name, Billing_Name, Billing_Address, Billing_City, Billing_State, Billing_Zip " + 
      "from Accounts " + 
      "where External_Processing=true and Active=true " + 
      "LIMIT #{from_index}, #{page_size}"
  end

end