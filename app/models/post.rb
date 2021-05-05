class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :is_clickbait

  def is_clickbait
    if /(Secret|Top \d{1,2}|Guess|Won't Believe)/.match(title).nil?
      errors.add(:title, 'it must be fake news')
    end
  end
end
