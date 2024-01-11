class FoodController < ApplicationController
    def index
        @foods = Food.where(user: current_user)
      end

      def show
        redirect_to foods_path, alert: 'Not a valid Food' and return unless /\A\d+\z/.match? params[:id]
        redirect_to foods_path, alert: 'Food was not found' and return unless food_exists? params[:id]
    
        @food = Food.where(user: current_user).find(params[:id])
      end
    
      
    end
