class CurrencySerializer < Blueprinter::Base
  view :normal do
    fields :id, :name
  end
end