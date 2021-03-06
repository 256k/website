# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsItemPolicy do
  let(:user)  { build_stubbed :user         }
  let(:admin) { build_stubbed :user, :admin }

  subject { described_class }

  permissions :index?, :show? do
    it { is_expected.to permit user  }
    it { is_expected.to permit admin }
  end
end
