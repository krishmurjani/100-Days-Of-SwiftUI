import Cocoa

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//let sortedTeam = team.sorted()
//print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    print("Before sorting:\nName 1: \(name1)")
    print("Name 2: \(name2)\n")
     
    if name1 == "Suzanne" {  
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)
