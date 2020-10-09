class RidesController < ApplicationController

    def create
        @attraction = Attraction.find_by(id: params[:attraction_id])
        @ride = Ride.new(attraction: @attraction, user: current_user)
        flash[:message] = @ride.take_ride
        if flash[:message]
            @ride.save
        end
        redirect_to user_path(@ride.user)
    end

end
