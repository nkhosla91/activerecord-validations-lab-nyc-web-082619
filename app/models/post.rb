class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 100}
    validates :summary, length: { maximum: 20}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess")) 
          errors.add(:clickbait, "That is not a clickbait worthy title. Try again.")
        end
      end
end
