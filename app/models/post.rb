class Post < ActiveRecord::Base
    # include ActiveModel::Validations
    # validates_with TitleValidator
    # binding.pry
    validates :title, presence: true
    validate :includes_clickbait
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} is not a valid category."}
    
    def includes_clickbait
        # binding.pry
        errors.add(:title, "is not a valid title") unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.start_with?(/Top [0-9]/) || title.include?("Guess"))
    end
end
