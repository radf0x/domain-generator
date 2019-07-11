# frozen_string_literal: true

require 'rails/generators/named_base'

# Reduce DDD boilerplate
class DomainGenerator < Rails::Generators::NamedBase
  desc 'Generates domain app_services, services, model and repository with specs with the given DOMAIN_NAME.'
  source_root File.expand_path('../templates', __FILE__)
  class_option :model, type: :string, default: '', desc: 'Generate Model class and repository with specs'
  class_option :repo, type: :boolean, default: true, desc: 'Generate Repository for Model'
  class_option :include_dry, type: :boolean, default: true, desc: 'Generate classes with dry-monads'
  class_option :app_service, type: :string, default: '', desc: 'Generate App Service class with specs'
  class_option :service, type: :string, default: '', desc: 'Generate Service class with spec'

  def generate
    raise ArgumentError.new('Missing domain name') if name.blank?

    generate_app_service if option_enabled?(:app_service)
    generate_service if option_enabled?(:service)
    generate_model if option_enabled?(:model)
    generate_repository if generate_repo?
  end

  private

  def generate_app_service
    template 'app_service.template', "app/domain/#{name.underscore}/app_services/#{options.app_service.underscore}.rb"
    template 'app_service_spec.template', "spec/domain/#{name.underscore}/app_services/#{options.app_service.underscore}_spec.rb"
  end

  def generate_service
    template 'service.template', "app/domain/#{name.underscore}/services/#{options.service.underscore}.rb"
    template 'service_spec.template', "spec/domain/#{name.underscore}/services/#{options.service.underscore}_spec.rb"
  end

  def generate_model
    template 'model.template', "app/domain/#{name.underscore}/services/models/#{options.model.underscore}.rb"
    template 'model_spec.template', "spec/domain/#{name.underscore}/services/models/#{options.model.underscore}_spec.rb"
    template 'model_factory.template', "test/factories/#{options.model}.rb"
  end

  def generate_repository
    template 'repository.template', "app/domain/#{name.underscore}/infrastructures/repos/#{options.model.underscore}.rb"
    template 'repository_spec.template', "spec/domain/#{name.underscore}/infrastructures/repos/#{options.model.underscore}_spec.rb"
  end

  def option_enabled?(opt)
    checked = options[opt.to_s].present?
    say("Not generating #{opt}.") unless checked
    checked
  end

  def generate_repo?
    say("Not generating repository for #{options.model}Model") unless options.model.present?
    say('Not generating repository') unless options.repo?
    options.model.present? && options.repo?
  end
end
