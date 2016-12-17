# frozen_string_literal: true
class Profile::Create < Trailblazer::Operation
  attr_reader :profile

  contract do
    properties :name, :surname, :phone, :email

    validation :default do
      required(:name).filled(:str?)
      required(:phone).filled(:str?)
      optional(:email).maybe(:str?)
      optional(:surname).maybe(:str?)
    end
  end

  def setup_model!(_params)
    # @model = UserAggregate.new

  end

  def process(params)
    validate(params, OpenStruct.new)
    contract.sync
    create
  end

  def create
    @profile = ProfileFabric.init(contract.name, contract.surname, contract.phone)
    repo.create_profile(@profile)
  end

  def repo
    @repo ||= ProfileRepository.new(DB)
  end
end
