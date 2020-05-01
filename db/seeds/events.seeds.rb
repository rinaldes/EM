ActiveRecord::Base.connection.execute("TRUNCATE events RESTART IDENTITY");
puts "========== Seeding events.. =========="

cities = [
  ['New York'     , 'New York'            , '40.6643' , '73.9385' ], 
  ['Los Angeles'  , 'California'          , '34.0194' , '118.4108'],
  ['Chicago'      , 'Illinois'            , '41.8376' , '87.6818' ],
  ['Houston'      , 'Texas'               , '29.7805' , '95.3863' ],
  ['Philadelphia' , 'Pennsylvania'        , '40.0094' , '75.1333' ],
  ['Phoenix'      , 'Arizona'             , '33.5722' , '112.0880'],
  ['San Antonio'  , 'Texas'               , '29.4724' , '98.5251' ],
  ['San Diego'    , 'California'          , '32.8153' , '117.1350'],
  ['Dallas'       , 'Texas'               , '32.7757' , '96.7967' ],
  ['San Jose'     , 'California'          , '37.2969' , '121.8193'],
  ['Austin'       , 'Texas'               , '30.3072' , '97.7560' ],
  ['Jacksonville' , 'Florida'             , '30.3370' , '81.6613' ],
  ['Indianapolis' , 'Indiana'             , '39.7767' , '86.1459' ],
  ['San Francisco', 'California'          ,'37.7751'  , '122.4193'],
  ['Columbus'     , 'Ohio'                , '39.9848' , '82.9850' ],
  ['Fort Worth'   , 'Texas'               , '32.7795' , '97.3463' ],
  ['Charlotte'    , 'North Carolina'      , '35.2087' , '80.8307' ],
  ['Detroit'      , 'Michigan'            , '42.3830' , '83.1022' ],
  ['El Paso'      , 'Texas'               , '31.8484' , '106.4270'],
  ['Memphis'      , 'Tennessee'           , '35.1035' , '89.9785' ],
  ['Boston'       , 'Massachusetts'       , '42.3320' , '71.0202' ],
  ['Seattle'      , 'Washington'          , '47.6205' , '122.3509'],
  ['Denver'       , 'Colorado'            , '39.7618' , '104.8806'],
  ['Washington'   , 'District of Columbia', '38.9041' , '77.0171' ],
  ['Nashville'    , 'Tennessee'           , '36.1718' , '86.7850' ],
  ['Baltimore'    , 'Maryland'            ,'39.3002'  , '76.6105' ],
  ['Louisville'   , 'Kentucky'            ,'38.1781'  , '85.6667' ],
  ['Portland'     , 'Oregon'              ,'45.5370'  , '122.6500'],
  ['Oklahoma'     , 'City Oklahoma'       , '35.4671' , '97.5137' ],
  ['Milwaukee'    , 'Wisconsin'           , '43.0633' , '87.9667' ]
]

(1..60).each_with_index do |event, index|
  start_date = Time.now+(Random.rand(-12...92).days)
  end_date = start_date.+(Random.rand(1...4).days)
  city = cities.sample
  Event.create!(
    :name => "Event #{index+1}",
    :start_date => start_date ,
    :end_date => end_date,
    :venue_name => Faker::Address.secondary_address,
    :address => Faker::Address.street_address,
    :latitude => city[2],
    :longitude => city[3],
    :description => Populator.words(30..90),
    :created_at => Time.now,
    :updated_at => Time.now,
    :event_size_id => EventSize.all.sample.id
  )
end
Event.update_all(:status => 'submitted')