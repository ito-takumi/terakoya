class DictionariesController < ApplicationController
  def index
    set_dictionaries
    set_new_dictionary
  end

  def show
    set_dictionary
  end

  # def new
  #   set_new_dictionary
  # end

  # def edit
  #   set_dictionary
  # end

  def create
    set_new_dictionary(true)
    if @dictionary.valid? and @dictionary.save
      redirect_to dictionaries_path, notice: "Dictionary created!"
    else
      flash.now[:error] = "ERROR!"
    end
  end

  def update
    set_dictionary
  end

  def destroy
    set_dictionary
  end

  private

  def set_dictionaries
    @dictionaries ||= Dictionary.all
  end

  def set_dictionary
    @dictionary ||= if params_id_is_number?
      Dictionary.find(params[:id])
    else
      Dictionary.find_by_word(params[:id])
    end
  end

  def set_new_dictionary(require_permit = false)
    @dictionary ||= if require_permit
      Dictionary.new(params_dictionary)
    else
      Dictionary.new
    end
  end

  def params_id_is_number?
    params[:id].to_i.to_s == params[:id]
  end

  def params_dictionary
    @params_dictionary ||= params.require(:dictionary).
      permit(:word, :urlsafe_word, :short_explanation, :explanation)
  end
end
