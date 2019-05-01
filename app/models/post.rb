class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  # CLICKBAIT_PARAMS = ["Won't Believe", "Secret", "Top", "Guess", "won't believe"]
  #
  CLICKBAIT_PARAMS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  # def clickbait
  #   if title
  #     if !CLICKBAIT_PARAMS.any? { |phrase| self.title.include?(phrase)}
  #       errors.add(:title, "Your title is not clickbait enough")
  #     end
  #   end
  # end

  def clickbait
    if title
      if !CLICKBAIT_PARAMS.any? { |phrase| phrase.match title }
        errors.add(:title, "Your title is not clickbait enough")
      end
    end
  end

end
