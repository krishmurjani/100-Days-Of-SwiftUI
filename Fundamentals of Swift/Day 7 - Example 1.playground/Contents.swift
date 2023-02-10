import Cocoa

func checkTwoStrings(string1: String, string2: String) -> Bool {
    (string1.sorted() == string2.sorted())
}

checkTwoStrings(string1: "shake", string2: "khseas")

func pythagoras(a: Double, b: Double) -> Double {
    sqrt((a * a) + (b * b))
}

pythagoras(a: 4, b: 3)
