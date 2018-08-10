class Listing < ApplicationRecord
    acts_as_taggable_on :house_rules
end
