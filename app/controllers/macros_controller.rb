class MacrosController < ApplicationController
before_action :set_macros, only: [:edit, :show, :update, :destroy]

  def index
    @macro = current_user.macros.order(created_at: :desc)
    @default_macro = current_user.default_macro
    @default_graph = {
      'Protein' => @default_macro.protein * 4,
      'Carbs' => @default_macro.carbs * 4,
      'Fats' => @default_macro.fats * 9
    }
    @other_macros = current_user.macros.select { |macro| macro != @default_macro };
    @macro_string = @macro.map(&:id).join(" ")
  end

  def new
    @macro = Macro.new
  end

  def create
    macro= Macro.new(macro_params)
    macro.user = current_user
    if macro.save!
      redirect_to macros_path
    else
      @macro = Macro.new
      render :new
    end
  end

  # def show
  # end

  def edit
  end

  def update
    @macro.update(macro_params)
    if @macro.save
      redirect_to macros_path(@macro)
    else
      render :edit
    end
  end

  def destroy
    @macro.destroy
    redirect_to macros_path
  end

  def change_default
    new_default = Macro.find(params[:new_default])
    success = current_user.change_default(new_default) 

    redirect_to macros_path

    # respond_to do |format|
    #   format.json {
    #     render json: { macro: new_default, success: success }
    #   }
    # end      
  end



private


  def set_macros
    @macro= Macro.find(params[:id])
  end

  def macro_params
    params.require(:macro).permit(:name, :protein, :carbs, :fats)
  end



end
