module Wijet  
  module FormHelper
    def select_enumeration(method)
      @template.select_tag "#{@object_name}[#{method}]",
        @template.options_from_collection_for_select(Enumeration[method], :to_s, :to_s , @object.send(method).to_s)
    end
  end
end
