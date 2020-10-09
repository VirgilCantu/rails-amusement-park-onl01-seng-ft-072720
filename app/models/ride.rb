class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        case
            when user.height < attraction.min_height && user.tickets < attraction.tickets
                "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." 
            when user.height < attraction.min_height
                "Sorry. You are not tall enough to ride the #{attraction.name}." 
            when user.tickets < attraction.tickets
                "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            else
                user.update(
                    tickets: user.tickets - attraction.tickets,
                    nausea: user.nausea + attraction.nausea_rating,
                    happiness: user.happiness + attraction.happiness_rating
                )
                
        end      
    end

    

end