class Post < ActiveRecord::Base
  belongs_to :author

  validate :clickbaiting

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


  @@clickbait_titles = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0..9]/i,
    /Guess/i
    ]

  def clickbaiting
    if @@clickbait_titles.none? {|pat| pat.match title}
      errors.add(:title, "must be clickbait")
    end
  end

end
