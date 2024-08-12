require "sqlite3"

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  # Should return an integer of the number of artists.
  results = db.execute("SELECT COUNT(*) FROM artists")
  results[0][0]
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name.
  # Should return an integer of the number of rows.
  db.execute("SELECT COUNT(*) FROM #{table_name}")[0][0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically.
  # Should return an array of strings sorted alphabetically.
  results = db.execute("SELECT name FROM artists ORDER BY name") # [[String], [String], [String], [String], [String]]
  results.flatten # [String, String, String, String, String]
end

def love_tracks(db)
  # TODO: return array of love songs' names.
  # Should return an array of strings (track names).
  db.execute("SELECT name FROM tracks WHERE name LIKE '%love%' ORDER BY name").flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending).
  # Should return an array of strings.
  query = <<~SQL
    SELECT name FROM tracks WHERE milliseconds > #{min_length} * 60000 ORDER BY milliseconds ASC
  SQL
  db.execute(query).flatten
end

def albums_per_artist(db)
  # TODO: return an array of arrays, each containing the artist's name and the number of albums they have
  query = <<~SQL
    SELECT artists.name, COUNT(*) as album_count FROM artists JOIN albums ON albums.artist_id = artists.id GROUP BY artists.name ORDER BY artists.name
  SQL
  db.execute(query)
end
