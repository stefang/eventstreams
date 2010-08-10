module ControllerMacros
  
  def should_have_filter(filter_name)
    should "have the filter #{filter_name}" do
      klass = self
      assert_equal true, klass.in_filter_chain?(filter_name, @controller), "Expected #{@controller.class} to have the filter #{filter_name}"
    end
  end

  def should_not_have_filter(filter_name)
    klass = self
    should "not have the filter #{filter_name}" do
      assert_equal false, klass.in_filter_chain?(filter_name, @controller), "Expected #{@controller.class} not to have the filter #{filter_name}"
    end
  end
  
  def in_filter_chain?(filter_name, controller)
    controller.class.filter_chain.any? { |f| f.method.to_sym == filter_name }
  end
end

Test::Unit::TestCase.extend(ControllerMacros)
