class Api::RolesController < ActionController::Base

  def index
    @roles = Role.all
    render json: @roles,
           except: %i[created_at updated_at]
  end

end
