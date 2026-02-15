class DecisionsController < ApplicationController
   
    def index 
        decisions = Decision.all.order(created_at: :desc)
        render json: decisions
    end 

    def create 
        decision = Decision.new(decision_params)
        
        if decision.save 
            render json: decision, status: :created
        else 
            render json: {errors: decision.errors.full_messages}, status: :unprocessable_entity
        end 
    end 

    private decision_params 
   
    def decision_params 
        params.require(:decision).permit(:title, :description, :status)
    end

end
