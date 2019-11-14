require 'rails_helper'
require 'spec_helper'

describe Book do
  subject(:book) do
    Book.new(
      genre: genre, author: author, image: image, title: title,
      editor: editor, year: year
    )
  end

  let(:genre) { Faker::Book.genre }
  let(:author) { Faker::Book.author }
  let(:image) { Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg') }
  let(:title) { Faker::Book.title }
  let(:editor) { Faker::Book.publisher }
  let(:year) { Faker::Number.between(from: 0, to: 2019) }

  describe '#create' do
    it do
      expect(book).to be_valid
    end

    context 'When genre is null' do
      let(:genre) { nil }
      it do
        expect(book).to be_invalid
      end
    end

    context 'When author is null' do
      let(:author) { nil }
      it do
        expect(book).to be_invalid
      end
    end

    context 'When image is null' do
      let(:image) { nil }
      it do
        expect(book).to be_invalid
      end
    end

    context 'When title is null' do
      let(:title) { nil }
      it do
        expect(book).to be_invalid
      end
    end

    context 'When editor is null' do
      let(:editor) { nil }
      it do
        expect(book).to be_invalid
      end
    end

    context 'When year is null' do
      let(:year) { nil }
      it do
        expect(book).to be_invalid
      end
    end
  end
end
