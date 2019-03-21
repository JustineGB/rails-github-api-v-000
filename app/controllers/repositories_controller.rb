class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get "https://api.github.com/users/repos" do |req|
      req.headers['Authorization'] = "token" + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @repos = JSON.parse(resp.body)
    
    user = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
  user_json = JSON.parse(user.body)
  session[:username] = user_json["login"]
  end

  def create
  end

end