module FormMacros
  def should_render_a_form_to(description, options = {}, &block)
    should "render a form to #{description}" do
      expected_url  = instance_eval(&block)
      form_method   = case options[:method]
        when "post", "put", "delete" : "post"
        else "get"
        end
      assert_select "form[action=?][method=?]",
                    expected_url,
                    form_method,
                    true,
                    "The template doesn't contain a <form> element with the action #{expected_url}" do

        unless %w{get post}.include? options[:method]
          assert_select "input[name=_method][value=?]",
                        options[:method],
                        true,
                        "The template doesn't contain a <form> for #{expected_url} using the method #{options[:method]}"
        end
      end
    end
  end
end

Test::Unit::TestCase.extend(FormMacros)