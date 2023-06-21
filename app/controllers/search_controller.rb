class SearchController < ApplicationController
    def google
        query = params[:query]
        search_engine_id = "f500ed52861e94b50"
        redirect_to "https://www.google.com/search?q=site:tanchiniproductions.com%20#{query}&cx=#{search_engine_id}", allow_other_host: true
    end
end
