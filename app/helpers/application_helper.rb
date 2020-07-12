module ApplicationHelper

    def render_nav_bar
      if logged_in?
        render partial: 'layouts/loggedin'
      else
        render partial: 'layouts/loggedout'
      end
    end
  end
