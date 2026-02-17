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

    def show 
        decision = Decision.find(params[:id])
        render json: decision

    end

    def update 
      
        decision = Decision.find(params[:id])

        if decision.update(decision_params)
        render json: decision
        else 
            render json: {errors: decision.errors.full_messages}, status: :unprocessable_entity
        end

    end

    def destroy
      decision = Decision.find(params[:id])
     decision.destroy

     render json: { message: "Decision deleted successfully" }, status: :ok
     end

    private
   
    def decision_params 
        params.require(:decision).permit(:title, :description, :status)
    end

end
