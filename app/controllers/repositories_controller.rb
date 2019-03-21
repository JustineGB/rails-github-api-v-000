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
    user_json = JSON.parse(user.body)
    session[:username] = user_json["login"]
  end

    def create
    resp = Faraday.post('https://api.github.com/user/repos') do |req|
      req.headers['Authorization'] = 'token ' + session[:token]
      req.headers['Accept'] = 'application/json'
      req.body = { 'name': params[:name] }.to_json
    end
    redirect_to '/'
  end

end