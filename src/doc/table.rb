require 'tty-table'
require 'colorize'
table = TTY::Table.new [["Luxury".green, "Adventurer".green],["content1","content2"], ["price1", "price2"] ]
puts table.render(:ascii, padding: [0, 1, 0, 1])