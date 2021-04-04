require "./controllers/BookingsController"

module Routes 
    def self.dispatch(choice)
        case choice
        when 1
            BookingsController::create
        when 2
            BookingsController::list
        when 3
            BookingsController::show
        # when 4
            # BookingsController::update
        when 5
            BookingsController::delete
        end
    end
end