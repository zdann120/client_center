class Document < ApplicationRecord
  belongs_to :account, optional: true
  mount_uploader :asset, AssetUploader
  validates :description, presence: true
end
