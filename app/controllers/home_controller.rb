class HomeController < ApplicationController
  def index
    @pages = Page.where(status: 'published', page_id: nil).order(:order)
    @sections = HomeSection.all.order(:order)

    @title = SystemSetting.find_by(name: 'title') || { value: "Open Access" }
    @subtitle = SystemSetting.find_by(name: 'subtitle') || { value: "" }
    @banner = SystemSetting.find_by(name: 'banner') || { value: "" }
  end

end
