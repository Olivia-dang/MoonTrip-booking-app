require "./controllers/BookingsController"

module Routes 
    def self.dispatch(choice)
        case choice
        when 1
            BookingsController::create
        when 2
            BookingsController::show
        # when 3
        #     BookingsController::update
        when 5
            BookingsController::list
        end
    end
end