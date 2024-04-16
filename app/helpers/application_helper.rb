module ApplicationHelper
  include Pagy::Frontend
  def inspect_session
    inspect = {}
    session.keys.each do |k|
      inspect[k] = session[k]
    end
    inspect
  end
  alias session_inspect inspect_session

  def slim_text(text)
    page =  Slim::Template.new{|t| text}
    page.render.html_safe
  end


end
