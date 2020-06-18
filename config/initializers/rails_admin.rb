RailsAdmin.config do |config|

  config.model Report do
    weight -1
  end

  config.model Category do
    create do
      field :name
    end

    edit do
      field :name
    end

    show do
      field :name
    end

    weight -2
  end

  config.model PostCategory do
    visible false
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
