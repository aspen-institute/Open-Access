require "administrate/field/base"

class RichEditorField < Administrate::Field::Base
  def to_s
   data
  end
end
