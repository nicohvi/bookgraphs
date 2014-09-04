require 'rails_helper'
require 'fileutils'

describe Book do

  context 'Paperclip' do
    let(:book) { create :book }
    let(:invalid_attachment) { File.new("#{Rails.root}/spec/files/invalid.mp4") }
    let(:valid_attachment) { File.new("#{Rails.root}/spec/files/valid.jpeg") }
    let(:valid_path) { "#{Rails.root}/spec/public/valid.jpeg" }

    it 'Doesn\'t upload an invalid attachment as cover' do
      expect{ book.update_attributes!(cover: invalid_attachment) }.to raise_error
      expect(book.errors.messages[:cover]).to_not be_empty
    end

    it 'Uploads a valid attachment as cover' do
      expect{ book.update_attributes!(cover: valid_attachment) }.to_not raise_error
      expect(book.cover.path).to eq(valid_path)
    end

  end

  after :all do
    FileUtils.rm_rf("#{Rails.root}/spec/public")
  end

end
