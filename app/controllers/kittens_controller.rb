class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @kittens }
            format.json { render :json => @kittens }
        end
    end

    def show
        @kitten = Kitten.find(params[:id])
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @kitten }
            format.json { render :json => @kitten }
        end
    end

    def new 
        @kitten = Kitten.new
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def create 
        kitten = Kitten.new(kitten_params)
        if kitten.save
            flash[:success] = "Successfully created"
            redirect_to kitten_path(kitten.id)
        else
            flash[:danger] = "Counld not create kitten"
            redirect_to new_kitten_path
        end
    end

    def update
        @kitten = Kitten.find(params[:id])
        kitten.update_attributes(kitten_params)
        if kitten.save
                flash[:success] = "Successfully created"
            redirect_to kitten_path(params[:id])
        else
            flash[:danger] = "Counld not create kitten"
            redirect_to kitten_path(params[:id])
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        flash[:success] = "Successfully deleted"
        redirect_to '/'
    end

private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :softness, :cuteness)
    end


end
