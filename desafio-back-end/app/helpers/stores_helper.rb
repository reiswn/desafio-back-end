module StoresHelper
  def value_as_money(value)
    number_to_currency(value.to_f / 100, locale: :br)
  end
end
