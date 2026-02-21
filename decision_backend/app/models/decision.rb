class Decision < ApplicationRecord
      enum status: {
    proposed: 0,
    accepted: 1,
    deprecated: 2,
    reversed: 3
  }

  scope :sorted, ->(sort_param) {
  return order(:id) if sort_param.blank?

  allowed_sorts = {
    "id_asc" => { id: :asc },
    "id_desc" => { id: :desc },
    "created_at_asc" => { created_at: :asc },
    "created_at_desc" => { created_at: :desc },
    "title_asc" => { title: :asc },
    "title_desc" => { title: :desc }
  }

  order(allowed_sorts[sort_param] || { id: :asc })
}

scope :search, ->(query) {
  return all if query.blank?
  
  where(
    "LOWER(title) LIKE :q OR LOWER(description) LIKE :q",
    q: "%#{query.downcase}%"
  )

}

scope :full_text_search, ->(query) {
  return all if query.blank?

  where(
    "MATCH(title, description) AGAINST(? IN NATURAL LANGUAGE MODE)",
    query
  )
}
 
  scope :filter_by_status, lambda { |status_param|
  return all if status_param.blank?
  valid_statuses = status_param.split(",") & Decision.statuses.keys
  return none if valid_statuses.empty?
  where(status: valid_statuses)
}


 validates :title, presence: true, length: { minimum: 3 }
 validates :description, presence: true, length: { minimum: 10 }
 validates :status, inclusion: { in: statuses.keys }


end
