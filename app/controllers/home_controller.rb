class HomeController < ApplicationController
  def index
    render template: 'home/index'
  end

  def redirect
    @group = redirect_group(params[:path])
    puts "ingroup #{@group}"    
    if @group.present?
      reset_session
      Current.group = @group
      session[:group_id] = @group.id
      cookies[:group_id] = {value: @group.id, expires: Time.now + 3.months}
      params[:format] = 'html'
      redirect_to group_path(@group)
    else
      cant_do_that(params[:path])
    end
  end

  private

  def redirect_group(path)
    @group = Group.find_by(Group.arel_table[:name].matches("%#{path}"))
    puts "inRedirect #{@group}"
    return @group
  end

end
