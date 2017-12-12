require "administrate/field/base"

class NestedLineItemField < Administrate::Field::Base
  def to_s
    data
  end
end
