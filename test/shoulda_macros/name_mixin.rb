# def should_have_name_mixin(factory = nil)
#   klass = model_class
#   @@factory = factory || klass.name.underscore.to_sym
# 
#   context "instance method #name?" do
#     context "with just firstname" do
#       setup do
# 
#         @model = Factory(@@factory, :firstname => "Bob", :lastname => nil, :email => "bob@jivatechnology.com")
#       end
# 
#       should "return true" do
#         assert @model.name?
#       end
#     end
# 
#     context "with just lastname" do
#       setup do
#         @model = Factory(@@factory, :firstname => nil, :lastname => "Smith", :email => "smith@jivatechnology.com")
#       end
# 
#       should "return true" do
#         assert @model.name?
#       end
#     end
# 
#     context "with neither firstname or lastname" do
#       setup do
#         @model = Factory(@@factory, :firstname => "", :lastname => nil, :email => "noone@jivatechnology.com")
#       end
# 
#       should "return false" do
#         assert !@model.name?
#       end
#     end
# 
#     context "with firstname and lastname" do
#       setup do
#         @model = Factory(@@factory, :firstname => "Bob", :lastname => "Smith", :email => "bob.smith@jivatechnology.com")
#       end
# 
#       should "return true" do
#         assert @model.name?
#       end
#     end
#   end
# 
#   context "instance method #name" do
#     context "when name is present" do
#       setup do
#         @model = Factory(@@factory, :firstname => "jim", :lastname => "bob", :email => "jim.bob@jivatechnology.com")
#       end
# 
#       should "return full name" do
#         assert_equal "Jim Bob", @model.name
#       end
#     end
# 
#     context "when name is not present" do
#       setup do
#         @model = Factory(@@factory, :firstname => nil, :lastname => nil, :email => "jim.bob@jivatechnology.com")
#       end
# 
#       should "return email address" do
#         assert_equal @model.email, @model.name
#       end
#     end
#   end
# 
#   context "instance method #email_with_name" do
# 
#     context "when model doesn't have a name" do
#       setup do
#         @model = Factory(@@factory, :firstname => nil, :lastname => nil, :email => "jim.bob@testland.com")
#       end
# 
#       should "return basic email address" do
#         assert_equal "jim.bob@testland.com", @model.email_with_name
#       end
#     end
# 
#     context "when the model has a name" do
#       setup do
#         @model = Factory(@@factory, :firstname => "Jim", :lastname => "Bob", :email => "jim.bob@testland.com")
# 
#       end
# 
#       should "return friendly email address" do
#         assert_equal "Jim Bob <jim.bob@testland.com>", @model.email_with_name
#       end
#     end
# 
#   end
# 
# end
# 
# 
