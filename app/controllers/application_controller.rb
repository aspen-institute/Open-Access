class ApplicationController < ActionController::Base
  before_action :set_navigation_links

  private

  def set_navigation_links
    @navigation_links = NavigationLink.all
  end
end
