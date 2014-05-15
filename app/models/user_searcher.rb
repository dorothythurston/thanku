class UserSearcher
  def initialize(query)
    @query = query
  end

  def results
    if @query
      find_user
    else
      user.none
    end
  end

  private

  attr_reader :query

  def find_user
    User.where(
        "name ilike :query OR email ilike :query", query: fuzzy_query
    ).distinct
  end

  def fuzzy_query
    "%#{query}%"
  end
end
