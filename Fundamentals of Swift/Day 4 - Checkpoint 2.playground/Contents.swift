import Cocoa

let songsInEachAlbum = [15, 13, 14, 16, 13, 15, 18, 17, 17]

print("Taylor Swift has \(songsInEachAlbum.count) studio albums.")

let songs = Set(songsInEachAlbum)

print("\(songs.count)")
