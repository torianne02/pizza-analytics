Sequel.seed do
  def run
    [
      ['albert'],
      ['sergei'],
      ['sebastian']
    ].each do |name|
      Person.create name: name
    end
  end
end 
