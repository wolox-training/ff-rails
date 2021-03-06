require 'rails_helper'
require 'spec_helper'

describe Book do
  context 'valid model' do
    subject(:book) { create(:book) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:editor) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to be_persisted }
  end
end
