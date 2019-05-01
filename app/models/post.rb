class Post < ActiveRecord::Base
  validate :clickbaiting

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  CLICKBAIT_PATTERNS = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]

  def clickbaiting
  if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    errors.add(:title, "must be clickbait")
  end
end
end
