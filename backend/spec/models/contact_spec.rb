# frozen_string_literal: true

require 'rails_helper'

describe Contact, type: :model do
  subject(:new_contact) { create(:contact) }

  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:phone) }
end
