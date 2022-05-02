require "administrate/field/base"

class IconField < Administrate::Field::Base
  def to_s
    data
  end
end
