FactoryGirl.define do
  factory :book do
    sequence(:title)   { |n| "Book Title #{n}" }
    sequence(:authors) { |n| ["John Smith #{n}"] }
    sequence(:img_url) { |n| "http://example.com/?id=#{n}&size=4&sth=else" }
    sequence(:state)   { |n| Book::STATES[n % Book::STATES.count] }

    factory :book_read do
      state 'readl'
    end

    factory :book_to_read do
      state 'to_read'
    end

    factory :book_not_interested do
      state 'not_interested'
    end
  end
end
