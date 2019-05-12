module API
  module V1
    class Pizzas < Grape::API
      version 'v1', using: :path

      resources :pizzas do
        desc 'Return all pizza'
        get '/' do
          # if topping params exists - find pizzas by topping
          if params.include?("topping")
            Pizza.where(topping: params[:topping])
          # if no params return all pizzas
          else
            Pizza.all
          end
        end

        desc 'Return day with highest sales of month'
        get '/monthly-sales' do
          @data = DB["WITH day_month_sales as (

            SELECT date_consumed, count(*) num_sales
              , to_char(date_consumed, 'YYYY-MM') month_year
            FROM pizzas
            GROUP BY date_consumed
              , to_char(date_consumed, 'YYYY-MM')
          )

          , max_sales_in_day_per_month as (

            SELECT month_year, MAX(num_sales) max_sales_in_month
            FROM day_month_sales
            GROUP BY month_year
          )

            SELECT date_consumed, num_sales
            FROM day_month_sales as dms
              INNER JOIN max_sales_in_day_per_month as msdpm
                ON dms.month_year = msdpm.month_year
                AND dms.num_sales = msdpm.max_sales_in_month
            ORDER BY date_consumed"]
          return @data
        end

        desc 'Return streaks of days that are > the day prior'
        get '/streaks' do
          @data = DB["
            WITH daily_pizzas as (
                SELECT date_consumed
                  , count(1) num_pizzas
                  , ROW_NUMBER() OVER (ORDER BY date_consumed) AS rank
                FROM pizzas
                GROUP BY date_consumed
            )

            select curr_day.date_consumed, curr_day.num_pizzas
            from daily_pizzas curr_day
              left join daily_pizzas prev_day
                on curr_day.rank = prev_day.rank + 1
             WHERE curr_day.num_pizzas > coalesce(prev_day.num_pizzas,0)
            order by curr_day.date_consumed, prev_day.date_consumed"]
          return @data
        end

        # returns ALL pizzas BY topping
        # desc 'Return all pizzas of a certain topping'
        # params do
        #   requires :topping, type: String
        # end
        # get ':topping' do
        #   Pizza.where(topping: params[:topping])
        # end

        # need to figure out how to sum all pizzas eaten on each day
        # then need to figure out how many consecutive days more pizzas have been
          # consumed than the day before
      end
    end
  end
end
