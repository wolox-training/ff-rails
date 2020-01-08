require 'rails_helper'
require 'spec_helper'

describe BookSuggestion do
  context 'valid model' do
    subject(:book_suggestion) { create(:book_suggestion) }
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:editor) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to be_persisted }
  end

  context 'invalid model' do
    %i[link author image title editor year].each do |field|
      subject(:book_suggestion) { build(:book_suggestion, field => nil) }
      it { is_expected.not_to be_valid }
      it 'is not persisted' do
        expect(subject.save).to be false
      end
    end
  end
end
