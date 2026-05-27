module Paginatable
  extend ActiveSupport::Concern
  include Pagy::Backend

  private

  def paginate(collection)
    pagy(collection, limit: per_page_param, page: params[:page])
  end

  def per_page_param
    requested = params[:per_page].to_i
    requested.between?(1, 100) ? requested : 25
  end

  def pagination_meta(pagy)
    {
      current_page: pagy.page,
      total_pages:  pagy.pages,
      total_count:  pagy.count,
      per_page:     pagy.limit
    }
  end

  def render_collection(data, pagy)
    render json: { data: data, meta: pagination_meta(pagy) }, status: :ok
  end
end
