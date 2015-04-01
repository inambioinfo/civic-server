class VariantsController < ApplicationController
  actions_without_auth :index, :show, :typeahead_results, :datatable

  def index
    variants = Variant.view_scope
      .page(params[:page].to_i)
      .per(params[:count].to_i)

      variants = if params[:gene_id].present?
                   variants.where(genes: { entrez_id: params[:gene_id] })
                 else
                   variants
                 end

    render json: variants.map { |v| VariantPresenter.new(v, true, true) }
  end

  def show
    variant = Variant.view_scope.find_by!(id: params[:id])
    render json: VariantPresenter.new(variant, true, true, true)
  end

  def update
    variant = Variant.view_scope.find_by(id: params[:id])
    authorize variant
    status = if variant.update_attributes(variant_params)
               :ok
             else
               :unprocessable_entity
             end
    attach_comment(variant)
    render json: VariantPresenter.new(variant), status: status
  end

  def datatable
    render json: VariantBrowseTable.new(view_context)
  end

  def typeahead_results
    render json: VariantTypeaheadResultsPresenter.new(view_context)
  end

  private
  def variant_params
    params.permit(:name, :description)
  end

  def comment_params
    params[:comment].permit(:title, :text)
  end

  def attach_comment(variant)
    if not comment_params.blank?
      Comment.create(comment_params.merge({ user: current_user, commentable: variant }))
    end
  end
end
