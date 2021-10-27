class PublicController < ApplicationController
  def home

    @drivers = Driver.all

    # require 'uri'
    # require 'net/http'
    # require 'openssl'
    # require 'json'
    #
    # url = URI("https://f1-live-motorsport-data.p.rapidapi.com/drivers/standings/2021")
    #
    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #
    # request = Net::HTTP::Get.new(url)
    # request["x-rapidapi-host"] = 'f1-live-motorsport-data.p.rapidapi.com'
    # request["x-rapidapi-key"] = '07ff6f15e2msh6c5ceba69640d44p1d8732jsn31c4ae083941'
    #
    # response = http.request(request)
    # result = response.read_body
    # data = JSON.parse(result)

    # @driver_name = data["results"][0]["driver_name"]
    # @driver_name = data["results"][0]["team_name"]
    # @driver_position = data["results"][0]["position"]
    # @driver_points = data["results"][0]["points"]
    #
    # @driver_data = data["results"]

    # puts data["results"][1]["driver_name"]
    # puts data["results"][1]["position"]
    # puts data["results"][1]["points"]

    # data["results"].each do |key, value|
    #   puts value
    # end
  end

  def index
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(20)
  end

  def profile
    @profile = Account.find_by_username params[:username]
    @posts = @profile.posts
  end

end
