class ApplicationController < ActionController::Base
 
  before_action :set_locale

  def set_locale

    if !params[:locale].nil?
      I18n.locale = params[:locale]
    end

  end

  private

  #def record_not_found
  #  render html: "Record <strong>not found</strong>", status: 404
  #end

  protected
 
    def params_id
      ActionController::Parameters.new(id: params[:id]).permit(:id)[:id]
    end


end
