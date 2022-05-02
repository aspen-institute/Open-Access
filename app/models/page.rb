class Page < ApplicationRecord
  belongs_to :page, foreign_key: "page_id", optional: true
  has_many :page_reference, dependent: :destroy

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { scope: :page_id }
  validates :slug, format: {
    with: /\A[a-z0-9\-]+\z/,
    message: "only allows lowercase letters, numbers and dashes"
  }

  before_validation :format_slug
  before_save :generate_path

  after_save :update_children_path

  before_destroy :destroy_children

  def full_path
    full_path = []

    if self.page.present?
      full_path.push(self.page.path)
    end

    full_path.push(self.slug)

    return full_path.join('/')
  end

  def children
    return Page.where(page_id: self.id, unlisted: false, status: 'published').order(:order)
  end

  def siblings
    return Page.where(page_id: self.page_id, unlisted: false, status: 'published').order(:order)
  end

  def navigation_links
    next_page = nil
    previous_page = nil

    children_pages = children.select(:id, :title, :subtitle, :path)
    sibling_pages = siblings.select(:id, :title, :subtitle, :path)


    if sibling_pages.size > 1
      passed = false
      previous = nil

      siblings.each do |sibling|
        if !passed && sibling.id == self.id
          passed = true
        elsif !passed
          previous = sibling
        else
          p sibling
          next_page = sibling
          previous_page = previous
          break
        end
      end
    end

    if previous_page.nil?
      previous_page = self.page
    end

    if children_pages.size > 0
      next_page = children_pages[0]
    end


    return {
      :next => next_page,
      :previous => previous_page,
    }
  end

  private

  def destroy_children
    children_pages = children

    children.each do |child|
      child.destroy
    end
  end

  def generate_path
    self.path = full_path
  end

  def update_children_path
    children_pages = children

    children.each do |child|
      child.path = child.full_path
      child.save
    end
  end

  def format_slug
    self.slug.downcase!
  end

end
