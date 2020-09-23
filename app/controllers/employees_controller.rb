class EmployeesController < ApplicationController

    before_action :get_employee, only: [:show, :update, :edit, :destroy]

    def index 
        @employees = Employee.all 
    end

    def new 
        @employee = Employee.new
        @dogs = Dog.all 
    end

    def create 
        @employee = Employee.create(employee_params)
        byebug
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        
        end
    end

    def show 
        byebug
    end

    private

    def get_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit!#(:first_name, :last_name, :title, :alias, :office, :dog_id => [])
    end
end
