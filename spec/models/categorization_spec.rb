require 'spec_helper'

describe Categorization do
  it { should validate_presence_of :book_id }
  it { should validate_presence_of :category_id }

  let(:first_book) {FactoryGirl.create(:book)}
  let(:second_book) {FactoryGirl.create(:book, title: 'Other name')}
  let(:category_one) {FactoryGirl.create(:category)}
  let(:category_two) {FactoryGirl.create(:category)}

  it 'should allow books to call categories' do
    Categorization.create(book_id: first_book.id,category_id: category_one.id)
    Categorization.create(book_id: second_book.id,category_id: category_one.id)
    Categorization.create(book_id: second_book.id,category_id: category_two.id)

    expect(second_book.categories.count).to eql(2)
    expect(first_book.categories.count).to eql(1)
  end

  it 'should allow categories to call books' do
    Categorization.create(book_id: first_book.id,category_id: category_one.id)
    Categorization.create(book_id: second_book.id,category_id: category_one.id)
    Categorization.create(book_id: second_book.id,category_id: category_two.id)

    expect(category_one.books.count).to eql(2)
    expect(category_two.books.count).to eql(1)
  end
end
