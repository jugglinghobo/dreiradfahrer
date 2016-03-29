require 'mechanize'

namespace :tracker do
  desc 'Load tracker data from tracker.com'
  task :load_data => :environment do
    agent = Mechanize.new
    login_page = agent.get(tracker_path)
    login_form = login_page.form
    login_form.send 'ctl00$MS$MC$LoginRP$LoginUser$UserName'.to_sym, username
    login_form.send 'ctl00$MS$MC$LoginRP$LoginUser$Password'.to_sym, password
    logged_in_page = agent.submit(login_form, login_form.buttons.first)
    csv_page = agent.get(csv_path)
    tracker_table = csv_page.search('//table[@id="ctl00_MS_MC_Pos_Pager_PosGrid_DXMainTable"]')
    tracker_rows = tracker_table.search('tr[@class="dxgvDataRow_DevEx"]')
    logger.info "found #{tracker_rows.count} rows for parsing"
    tracker_rows.each do |row|
      utc_datetime_str = row.children[3].text
      position_str = row.children[4].text
      logger.info "#{utc_datetime_str}: #{position_str}"
      create_map_marker(utc_datetime_str, position_str)
    end
  end
end

def create_map_marker(datetime_str, position_str)
  utc_time = Time.parse (datetime_str + ' UTC')
  longitude, latitude = parse_position(position_str)
  marker = MapMarker.new(
    :timestamp => utc_time,
    :longitude => longitude,
    :latitude => latitude
  )
  if marker.save
    logger.info "Created new MapMarker at #{marker.longitude}/#{marker.latitude}"
  else
    logger.info "Could not create MapMarker: #{marker.errors.full_messages.join(', ')}"
  end
end

# Takes a string of form 'x,xxxxx / y,yyyyy'
# and returns an array of form [y.yyyyy, x.xxxxx]
def parse_position(string)
  string.split('/').map(&:squish).reverse
end

def csv_path
  'https://admin.tracker.com/Customer/DeviceMap/Position.aspx?ID=2104964'
end

def tracker_path
  'https://admin.tracker.com/Public/Login.aspx'
end

def username
  ENV['TRACKER_USERNAME']
end

def password
  ENV['TRACKER_PASSWORD']
end
