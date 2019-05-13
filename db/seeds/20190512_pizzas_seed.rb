Sequel.seed do
  def run
    [
      [1,'pepperoni','2015-01-01'],
      [1,'sausage','2015-01-02'],
      [1,'pineapple','2015-01-03'],
      [1,'pepperoni','2015-01-06'],
      [1,'pepperoni','2015-01-06'],
      [1,'sausage','2015-01-07'],
      [1,'sausage','2015-01-07'],
      [1,'pineapple','2015-01-07'],
      [1,'pineapple','2015-01-08'],
      [1,'pepperoni','2015-01-09'],
      [1,'sausage','2015-01-10'],
      [1,'pineapple','2015-01-11'],
      [1,'pineapple','2015-01-12'],
      [1,'sausage','2015-01-13'],
      [1,'pepperoni','2015-01-15'],
      [1,'pineapple','2015-01-17'],
      [2,'sausage','2015-01-01'],
      [2,'sausage','2015-03-01'],
      [2,'pineapple','2015-03-01'],
      [2,'pepperoni','2015-08-01'],
      [3,'pepperoni','2015-02-01'],
      [3,'pepperoni','2015-04-01'],
      [3,'sausage','2015-05-01'],
      [3,'pineapple','2015-05-01'],
      [3,'pepperoni','2015-05-01']
    ].each do |person_id, topping, date_consumed|
      Pizza.create person_id: person_id, topping: topping, date_consumed: date_consumed
    end
  end 
end
