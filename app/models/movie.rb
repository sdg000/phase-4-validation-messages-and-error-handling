class Movie < ApplicationRecord

    # constant containing category values
    CATEGORIES = ["Comedy", "Drama", "Animation", "Mystery", "Horror", "Fantasy", "Action", "Documentary", "Science Fiction"]

    # requiring :categories to include one of the CATEGORIES elements above or show error message.
    validates :category, inclusion: { 
        in: CATEGORIES, 
        message: "must be one of:  #{CATEGORIES.join(', ')}"
    }

    # requiring presence of :title and  :poster_url
    validates :title, :poster_url, presence: true

    # setting Valid year atrributes values as only options between 1888 - 2022
    validates :year, numericality: {
        greater_than_or_equal_to: 1888,
        less_than_or_equal_to: Date.today.year
    }

end
