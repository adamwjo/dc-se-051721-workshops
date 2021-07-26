class SongsController < ApplicationController
    def index
        render json: Song.all
    end

    def show
        song = Song.find_by(id: params[:id])
        if song
            render json: song
        else
            render json: {error: "song not found"}, status: :not_found
        end
    end

    def top_charts
        render json: Song.most_reviewed
    end
end
