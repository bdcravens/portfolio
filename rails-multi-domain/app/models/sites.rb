class Sites

  def self.user_can_access(user, host)
    has_access = false
    has_access = true if user.admin?
    site = site_by_host(host)
    has_access = true if ( user.call_center? && site=='calls' )

    if !has_access && user.customer
      has_access = (site == 'customers')
    end

    has_access
  end

  def self.site_by_host(host)
    site = 'customers'

    YAML.load_file(File.join(Rails.root, 'config', 'sites.yml')).each do |type, hosts|
      site = type if hosts.include?(host)
    end

    site
  end
end
