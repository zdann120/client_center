class Document < ApplicationRecord
  belongs_to :account
  mount_uploader :asset, AssetUploader
  validates :description, presence: true
end
