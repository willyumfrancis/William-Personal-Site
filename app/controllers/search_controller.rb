class SearchController < ApplicationController
    def google
        query = params[:query]
        search_engine_id = "80523033ec3b94762"
        redirect_to "https://www.google.com/search?q=site:willfrancisco.com%20#{query}&cx=#{search_engine_id}", allow_other_host: true
    end
end
