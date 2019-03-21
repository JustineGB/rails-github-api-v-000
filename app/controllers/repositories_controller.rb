class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get "https://api.github.com/users/repos" do |req|
      req.headers['Authorization'] = "token" + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @repos = JSON.parse(resp.body)
    
    user = Faraday.get "https://api.github.com/users/repos" do |req|
      req.headers['Authorization'] = "token" + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    session[:username] = user_json["login"]
  end

  def create
  end

end