require 'tty-table'
require 'colorize'
# rows = []
# rows << ["-Delux room at Kangaroo spaceship, with access to the adjoining ensuite bathroom.","- Capsule pod and access to the public bathroom, no shower.
# "]
# rows << ["- Return flight tickets", "- Return flight tickets"]
# rows << [ "2 mil USD", "1.5 mil USD"]
# table = TTY::Table.new(["Luxury".green, "Adventurer".green], rows)
# puts table.render(:ascii, padding: [0, 1, 0, 1])

table = TTY::Table.new(["Luxury".green, "-Delux room at Kangaroo spaceship"],[" ","access to the adjoining ensuite bathroom"],[" ", "- Return flight tickets"], ["Luxury".green, "-Delux room at Kangaroo spaceship"],[" ","access to the adjoining ensuite bathroom"],[" ", "- Return flight tickets"])

puts table.render(:ascii)

