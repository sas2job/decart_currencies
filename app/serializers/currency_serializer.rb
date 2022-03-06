class CurrencySerializer < Blueprinter::Base
  view :normal do
    fields :id, :name
  end

  view :extended do
    include_view :normal
    field :rate
  end
end
