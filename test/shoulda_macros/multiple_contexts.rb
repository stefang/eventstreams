module Contexts
  # Run multiple context using the same test suit
  def multiple_contexts(*contexts, &blk)
    contexts.each { |context|
      if respond_to?(context)
        send(context, &blk) 
      else
        raise "Context #{context} missing"
      end
    }
  end  
end

Test::Unit::TestCase.extend(Contexts)