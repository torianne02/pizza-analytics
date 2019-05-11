# module API
#   module V1
#     class Pizzas < Grape::API
#       include API::V1::Defaults
#
#       resource :pizzas do
#         # returns ALL pizzas
#         desc "Return all pizza"
#         get "", root: :pizzas do
#           Pizzas.all
#         end
#
#         # returns ALL pizzas BY topping
#         desc "Return all pizzas of a certain topping"
#         params do
#           requires :type, type: String, desc: "Type of topping"
#         end
#         get ":type", root: "pizzas" do
#           Pizzas.where(type: permitted_params[:type]).first!
#         end
#
#         # need to figure out how to sum all pizzas eaten on each day
#         # then need to figure out how many consecutive days more pizzas have been
#           # consumed than the day before
#       end
#     end
#   end
# end
