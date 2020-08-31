class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

RailsApp::Application.routes.draw do
  draw :customers
  draw :admin
  draw :calls
  draw :proxy_api
end