module Api
  module V1
    class DecisionsController < ApplicationController
      before_action :set_decision, only: [:show, :update, :destroy]

   def index
    page = params[:page].to_i
    per_page = params[:per_page].to_i

  page = 1 if page <= 0
  per_page = 10 if per_page <= 0
  per_page = 50 if per_page > 50

  base_query = Decision
                .full_text_search(params[:q])
                .filter_by_status(params[:status])
                .sorted(params[:sort])

  total_count = base_query.count
  total_pages = (total_count.to_f / per_page).ceil

  decisions = base_query
                .offset((page - 1) * per_page)
                .limit(per_page)

    render json: {
    page: page,
    per_page: per_page,
    total_count: total_count,
    total_pages: total_pages,
    data: decisions
      }, status: :ok
    end

      def create
        decision = Decision.new(decision_params)

        if decision.save
          render json: decision, status: :created
        else
          render json: { errors: decision.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @decision, status: :ok
      end

      def update
        if @decision.update(decision_params)
          render json: @decision, status: :ok
        else
          render json: { errors: @decision.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @decision.destroy
        head :no_content   # more REST-correct than returning message
      end

      private

      def set_decision
        @decision = Decision.find(params[:id])
      end

      def decision_params
        params.require(:decision).permit(:title, :description, :status)
      end
    end
  end
end