class Symbol
  def ===(object)
    object.kind_of?(Enumeration) ? object === self : super
  end
end
