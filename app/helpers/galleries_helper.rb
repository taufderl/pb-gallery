module GalleriesHelper

  def active_tab_class(tab)
    if params[:tab] == tab
      return 'active'
    else
      return "#{params[:tab]} - #{tab}"
    end
  end
end
