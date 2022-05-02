class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true


  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  validates :name, presence: true, uniqueness: true

  scopify

  before_validation :format_name

  def display_resource(role)
    role.name
  end

  def to_s
    self.name
  end

  private

  def format_name
    self.name.downcase!
  end
end
