class LessonsController < ApplicationController

before_action :set_lesson, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]

    def index
        @lessons = current_user.lessons
    end
    
    def new
        @lesson = current_user.lessons.build
    end

    def create
        @lesson = current_user.lessons.build(lesson_params) 
        if @lesson.save
            redirect_to @lesson, notice:"Votre annonce a été ajoutée avec succès"
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @lesson.update(lesson_params)
            redirect_to @lesson, notice:"Modification enregistrée..."
        else
            render :edit
        end
    end
    
private
    def set_lesson
        @lesson = Lesson.find(params[:id])
    end
    
    def lesson_params
       params.require(:lesson).permit(:lesson_level, :lesson_duration, :price, :is_equipment, :active) 
    end
    
end
