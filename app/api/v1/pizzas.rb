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
          # using raw SQL with Sequel to return day with highest consumption in each month
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
        # using raw SQL with Sequel to return streaks of days that consump is > prior day
        get '/streaks' do
          @pizzas = DB["SELECT date_consumed, count(*) num_pizzas
            FROM pizzas
            GROUP BY date_consumed
            ORDER BY date_consumed"]

          @streaks = []
          @current_streak = []
          @previous_day = {}

          @pizzas.each do |pizza|
            # if previous day is empty, populate it
            if @previous_day == {}
              @previous_day = pizza
            # if num of pizzas on current day are > previous day's
            elsif pizza[:num_pizzas] > @previous_day[:num_pizzas]
              # if current_streak is empty add current pizza
              if @current_streak == []
                 @current_streak.push(pizza)
              # if !empty make sure today's num of pizzas is > last pizza pushed
              elsif pizza[:num_pizzas] > @current_streak[@current_streak.length-1][:num_pizzas]
                @current_streak.push(pizza)
              end
            # if current streak is populated and current num of pizzas is < previous pizza
            elsif @current_streak.length > 1
              @streaks.push(@current_streak)
              @current_streak = []
            else
              @current_streak = []
            end
            @previous_day = pizza
          end

          if @current_streak.length > 1
            @streaks.push(@current_streak)
          end

          return @streaks.to_json
        end
      end
    end
  end
end
