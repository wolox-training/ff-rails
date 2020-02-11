require 'rails_helper'
require 'spec_helper'

describe BookSuggestion do
  context 'valid model' do
    let!(:user) { create(:user) }
    subject(:book_suggestion) { create(:book_suggestion, user: user) }
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:editor) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to be_persisted }
  end
end
