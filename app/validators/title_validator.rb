class TitleValidator < ActiveModel::Validator
    def validate(record)
        # binding.pry
        unless includes_clickbait(record.title)
            record.errors[:title] << "Title needs to be clickbaity."
        end
    end

    private

    def includes_clickbait(title)
        # binding.pry
        if title.include?("Won't Believe") || title.include?("Secret") || title.start_with?(/Top [0-9]/) || title.include?("Guess")
            true
        else
            false
        end
    end
end