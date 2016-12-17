# frozen_string_literal: true
class Profile::AddCar < Trailblazer::Operation
  attr_reader :profile

  contract do
    properties :model, :mark

    validation :default do
      required(:model).filled(:str?)
      required(:mark).filled(:str?)

    end
  end

  def setup_model!(params)
    # @model = UserAggregate.new
    @profile = repo.by_id(params[:id]) || raise(RuntimeError, 'Aggregate not found')
  end

  def prepare_form(params)
    validate(params, OpenStruct.new)
    contract.sync
  end

  def process(params)
    prepare_form(params)
    profile.add_car(contract.model, contract.mark)
    repo.save_profile(profile)
  end

  def repo
    @repo ||= ProfileRepository.new(DB)
  end
end
