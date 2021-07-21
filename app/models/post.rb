class Post < ApplicationRecord
    validate :title_is_clickbait
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    # validate :title_is_clickbait

    def title_is_clickbait
        if title && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
        # unless title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Not clickbait-y enough!")
        end
    end

end