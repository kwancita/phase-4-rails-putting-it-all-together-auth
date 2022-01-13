class RecipesController < ApplicationController
    # skip_before_action :authorize, only: :create
    def create
        recipe = @current_user.recipe.create(recipe_params)
        if recipes.valid?
            render json: recipe, status: :created
        else
            render json: { error: "Invalid recipe" }, status: :unprocessable_entity
        end
    end

    private
    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete )
    end
end
