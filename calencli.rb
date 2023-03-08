require "date"
id = 0

@events = [
  { "id" => (id = id.next),
    "start_date" => "2022-08-03T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => %w[Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-03T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2022-08-03T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-04T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => %w[Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-04T12:45:00-05:00",
    "title" => "Soft Skills -w Mindsets",
    "end_date" => "2022-08-04T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Diego"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-05T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => %w[Diego Andre Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-05T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2022-08-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-08T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2022-08-08T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => %w[Diego Teddy Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-08T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2022-08-19T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-08-09T12:00:00-05:00",
    "title" => "English for Engineers",
    "end_date" => "2021-08-19T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-08-09T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2021-08-20T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-08-10T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2021-08-10T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-08-11T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-08-11T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
]

# Methods


@actual_day = Date.today


day_number = @actual_day.cwday == 7 ? 0 : @actual_day.cwday
beginnig_week = @actual_day - day_number
@week = (beginnig_week..beginnig_week + 6).to_a
@week.map! { |day| day.strftime("%Y-%m-%d") }

def calcular_week(day)
  day_number = day.cwday == 7 ? 0 : day.cwday
  beginnig_week = day - day_number
  @week = (beginnig_week..beginnig_week + 6).to_a
  @week.map! { |fecha| fecha.strftime("%Y-%m-%d") }
end


# NEXT METHOD
def next_week
  @actual_day += 7
  calcular_week(@actual_day)
end

# PREV METHOD
def previous_week
  @actual_day -= 7
  calcular_week(@actual_day)
end


def list()
  @week.each do |date_week|
    date_week = DateTime.parse(date_week)
    value = "#{date_week.strftime('%a %b %d')} No events."
    aux = true
    @events.each do |event|
      start_date = DateTime.parse(event["start_date"])
      if start_date.month == date_week.month &&  start_date.year == date_week.year && start_date.cweek == date_week.cweek && start_date.day == date_week.day
        aux = false
        puts "#{start_date.strftime('%a %b %d')} #{start_date.strftime('%H:%M')}  #{event["title"]}(#{event["id"]})"
      end
    end
    if aux
      puts "#{date_week.strftime('%a %b %d')} #{"No events".rjust(16)}."
    end
  end
end


def show
  print "Event ID: "
  eventId = gets.chomp
  event = @events.find { |event| event["id"] == eventId.to_i }
  if event.nil?
    puts "Event not found"
  else
    start_date = event["start_date"].length == 10 ? event["start_date"] : DateTime.parse(event["start_date"]).strftime('%Y-%m-%d')
    puts "date: #{start_date}"
    puts "title: #{event["title"]}"
    puts "calendar: #{event["calendar"]}"
    puts "Notes: #{event["notes"]}"
    puts "Guests #{event["guests"]}"
  end
end

def update
  print "Ingresa el ID del evento que desees actualizar: "
  upiD = gets.chomp
  event = @events.find { |event| event["id"] == upiD.to_i }
  start_date = DateTime.parse(event["start_date"])
  puts "date actual: #{start_date.strftime('%Y-%m-%d')}"
  print "Ingresa la nueva fecha :"
  newDate = gets.chomp  
  start_date = DateTime.parse(event["start_date"]=newDate)
  puts "date actualizada: #{start_date.strftime('%Y-%m-%d')}" 
  puts "title: #{event["title"]}"
  print "Ingresa el nuevo Title:"
  newTitle = gets.chomp
  event["title"]=newTitle
  puts "title: #{event["title"]}"
  puts "calendar: #{event["calendar"]}"
  print "Ingresa el nuevo Calendar:"
  newCalendar = gets.chomp
  event["calendar"]=newCalendar
  puts "calendar: #{event["calendar"]}"
  puts "Notes: #{event["notes"]}"
  print "Ingresa el nuevo Notes:"
  newNotes = gets.chomp
  event["notes"]=newNotes
  puts "notes: #{event["notes"]}"
  puts "Guests: #{event["guests"]}"
  print "Ingresa la cantidad de nuevo Guests: "
  cantNewGuest = gets.chomp
  if cantNewGuest != "0" && cantNewGuest != "1"
    event["guests"] = []
    for n in 1..cantNewGuest.to_i
      puts "Ingresa el nombre del guest:"
      newGuests = gets.chomp
      arrayGuest = event["guests"]
      arrayGuest.push(newGuests)
    end
  elsif cantNewGuest == "0"
    event["guests"] = []
  elsif cantNewGuest == "1"
    event["guests"] = []
    puts "Ingresa el nombre del guest:"
    newGuests = gets.chomp
    arrayGuest = event["guests"]
    arrayGuest.push(newGuests)
  end
  puts "guests: #{event["guests"]}"
  puts "-"
  puts "Datos actualizados"
  puts "date: #{start_date.strftime('%Y-%m-%d')}"
  puts "title: #{event["title"]}"
  puts "calendar: #{event["calendar"]}"
  puts "Notes: #{event["notes"]}"
  puts "Guests: #{event["guests"]}"

end

def check_date(string)
  format_ok = string.match(/\d{4}-\d{2}-\d{2}/)
  parseable = Date.strptime(string, '%Y-%m-%d') rescue false

  if string == 'never' || format_ok && parseable
    return true
  end
  return false
end


def create(id)
  print "start_date (yyyy-mm-dd): "
  start_date = gets.chomp
  while !check_date(start_date)
    puts "Type a valid date: yyyy-mm-dd"
    print "start_date (yyyy-mm-dd): "
    start_date = gets.chomp
  end
  print "title: "
  title = gets.chomp

  while title == ""
    puts "Cannot be blank"
    print "title: " 
    title = gets.chomp
  end
  print "end_date (yyyy-mm-dd): "
  end_date = gets.chomp
  while !check_date(end_date)
    puts "Type a valid date: yyyy-mm-dd"
    print "end_date (yyyy-mm-dd): "
    end_date = gets.chomp
  end
  print "notes: "
  notes = gets.chomp
  print "guests: "
  contenido = gets.chomp
  guests = [contenido]
  print "calendar: "
  calendar = gets.chomp
  
  new_event = {
    "id" => (id = id.next),
    "start_date" => start_date,
    "title" => title,
    "end_date" => end_date,
    "notes" => notes,
    "guests" => guests,
    "calendar" => calendar
  }
  @events.push(new_event)
end

def delete
  print "Id: "
  id = gets.chomp
  @events.delete_if {|event| event["id"] == id.to_i}
end

# Main
puts "-----------------------------------CalenCLI-----------------------------------"
puts ""
list()
puts ""
while @action != "exit"
  puts "-----------------------------------CalenCLI-----------------------------------"
  puts "list | create | show | update | delete | next | prev"
  print "action: "  
  @action = gets.chomp
  puts ""
  puts "-----------------------------------CalenCLI-----------------------------------"
  case @action
  when "list"
    list()
  when "create"
    create(id)
  when "show"
    show()
  when "update"
    update()
  when "delete"
    delete()
  when "next"
    next_week
    list()
  when "prev"
    previous_week
    list()
  when "exit"
    puts "Cerrando el programa"
  else 
    puts "Acción no soportada"
  end
end