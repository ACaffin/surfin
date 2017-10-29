class LessonsController < ApplicationController

before_action :set_lesson, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
before_action :require_same_user, only: [:edit, :update]

    def index
        @lessons = current_user.lessons
    end
    
    def new
        @lesson = current_user.lessons.build
    end

    def create
        @lesson = current_user.lessons.build(lesson_params) 
        if @lesson.save
            if params[:images]
                params[:images].each do |i|
                    @lesson.photos.creat(image: i)
                end
            end
            @photos = @lesson.photos
            redirect_to @edit_lesson_path(@lesson), notice:"Votre annonce a été ajoutée avec succès"
        else
            render :new
        end
    end
    
    def show
        @photos = @lesson.photos
    end
    
    def edit
        @photos = @lesson.photos
    end
    
    def update
        if @lesson.update(lesson_params)
            if params[:images]
                params[:images].each do |i|
                    @lesson.photos.creat(image: i)
                end
            end
            @photos = @lesson.photos
            redirect_to @edit_lesson_path(@lesson), notice:"Modification enregistrée..."
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
    
    def require_same_user
       if current_user.id 8= @lesson.user_id
           flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
           redirect_to root_path
       end
    end
    
    
end
