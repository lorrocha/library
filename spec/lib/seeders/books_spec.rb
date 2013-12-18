require 'spec_helper'

describe Seeders::Books do
  let(:seeder) {Seeders::Books}

  it 'seeds books' do
    seeded_book = Seeders::Books.books.first[0]
    seeder.seed
    expect(Book.where(title: seeded_book)).to be_present
  end

  it 'does not create duplicates' do
    seeder.seed
    pre_count = Book.count
    seeder.seed
    expect(Book.count).to eql(pre_count)
  end
end
