class DogsController < ApplicationController
    before_action :get_dog, only: [:show, :edit, :update, :destroy]

    def index 
        @dogs = Dog.all 
    end

    def new 
        @dog = Dog.new
        @employee = Employee.all
    end

    def show
    end

    private

    def get_dog
        @dog = Dog.find(params[:id])
    end

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :employee_id => [])
    end
end
