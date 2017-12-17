class PagesController < ApplicationController


  def show
    @tasks = Task.all.paginate(page: params[:tasks_page], per_page: 5)
    @participants = Participant.all.paginate(page: params[:participants_page], per_page: 5)
    @attendances = Attendance.all.paginate(page: params[:participants_page], per_page: 5)
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.slim"))
  end
end
