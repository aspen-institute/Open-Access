require "administrate/base_dashboard"

class PageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    icon: Field::String,
    title: Field::String,
    subtitle: Field::String,
    description: Field::String,
    color: Field::String,
    banner: Field::String,
    show_text_on_banner: Field::Boolean,
    unlisted: Field::Boolean,
    slug: Field::String,
    page: Field::BelongsTo.with_options(
      include_blank: true,
      searchable_fields: ['title'],
    ),
    order: Field::Number,
    status: Field::Select.with_options(
      collection: ['draft', 'published']
    ),
    content: RichEditorField.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    icon
    title
    subtitle
    description
    color
    page
    slug
    order
    unlisted
    status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    icon
    title
    subtitle
    description
    color
    banner
    show_text_on_banner
    unlisted
    page
    slug
    order
    status
    content
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    icon
    title
    subtitle
    description
    color
    banner
    show_text_on_banner
    unlisted
    page
    slug
    order
    status
    content
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how pages are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(page)
    "##{page.id} - #{page.title}"
  end
end
