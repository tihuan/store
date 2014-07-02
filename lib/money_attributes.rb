module MoneyAttributes
  extend ActiveSupport::Concern
  module ClassMethods
    def money_attributes(*args)
      args.each do |attribute|
        cents_attribute = "#{attribute}_in_cents"
        define_method(attribute) do
          send(cents_attribute).try("/", 100.0)
        end

        define_method("#{attribute}=") do |value|
          value.gsub!(/[^\d.]/, "") if value.is_a? String
          send("#{cents_attribute}=", value.try(:to_f).try("*", 100))
        end

        define_method("#{attribute}_money") do
          Money.new(send("#{attribute}_in_cents").to_f) || 0, send("currency")).format
        end
        attr_accessible attribute if accessible_attributes.include?(cents_attribute)
      end
    end
  end
end
