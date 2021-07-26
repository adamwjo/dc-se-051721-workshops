class ReviewsController < ApplicationController
    def create
       review = Review.create(review_params)
       if review.valid?
           render json: review.song, status: :created
       else
            render json: review.errors.full_messages, status: :unprocessable_entity
       end

    end

    private

    def review_params
        params.permit(:comment, :rating, :song_id, :super_fan_id)
    end
end
