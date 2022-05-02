class PageController < ApplicationController

  def show
    slugs = params[:path].split('/')
    page = nil

    begin
      slugs.each_with_index do |slug, index|
        if !current_user.nil? && current_user.has_any_role?(:admin, :editor)
          if !page.nil?
            page = Page.find_by(slug: slug, page_id: page.id)
          elsif index == 0
            page = Page.find_by(slug: slug, page_id: nil)
          end
        else
          if !page.nil?
            page = Page.find_by(slug: slug, page_id: page.id, status: 'published')
          elsif index == 0
            page = Page.find_by(slug: slug, page_id: nil, status: 'published')
          end
        end
      end
    rescue ActiveRecord::RecordNotFound
      raise ActionController::RoutingError.new('Not Found')
    end

    if page.nil?
      raise ActionController::RoutingError.new('Not Found')
    end

    @page = page
  end

end
