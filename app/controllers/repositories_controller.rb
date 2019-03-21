class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    #resp = Faraday.get "https://api.github.com/users/repos" do |req|
      #req.body = { 'client_id': client_id, 'client_secret': client_secret, 'code': code }
      #req.headers['Accept'] = 'application/json'
    #end
    @repos = JSON.parse(resp.body)
  end

  def create
  end

end