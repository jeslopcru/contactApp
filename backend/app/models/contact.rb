# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :first_name, :second_name, :phone, presence: true
end
