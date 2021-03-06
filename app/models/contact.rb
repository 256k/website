# frozen_string_literal: true
class Contact < ApplicationRecord
  after_commit :send_to_external_list, on: :create

  belongs_to :collectible, polymorphic: true

  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_uniqueness_of :email, case_sensitive: false

  def send_to_external_list
    ExternalContactCreationJob.perform_later(email: email)
  end
end
