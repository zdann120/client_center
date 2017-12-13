class Appointment < ApplicationRecord
  has_secure_token
  belongs_to :attendable, polymorphic: true
  enum kind: [:phone_conference, :in_person, :video_conference]
  enum state: [:submitted, :reviewed, :approved, :disapproved, :canceled, :complete]
end
