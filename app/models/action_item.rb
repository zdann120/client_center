class ActionItem < ApplicationRecord
  belongs_to :actor, polymorphic: true
end
