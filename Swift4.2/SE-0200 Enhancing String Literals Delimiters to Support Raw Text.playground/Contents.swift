import UIKit

// SE-0200 added the ability to create raw strings, where backslashes and quote marks are interpreted as those literal symbols rather than escapes characters or string terminators. This makes a number of use cases more easy, but regular expressions in particular will benefit.

let rain_old = "The \"rain\" in \"Spain\" falls mainly on the Spaniards."
let rain = #"The "rain" in "Spain" falls mainly on the Spaniards."#

let keypaths_old = "Swift keypaths such as \\Person.name hold uninvoked references to properties."
let keypaths = #"Swift keypaths such as \Person.name hold uninvoked references to properties."#

let name = "Jeff"
let say_old = "My name is \(name)."
let say = #"My name is \#(name)."#

let hashTag_old = "My dog said \"woof\"#gooddog"
// 這時候新的寫法破功了？
//let hashTag = #"My dog said "woof"#gooddog"#
let hashTag = ##"My dog said "woof"#gooddog"##
// 其實 # 的數量前後一致就好了，不限定一個或兩個
let hashTag_also = #####"My dog said "woof" #gooddog"#####

let answer = 42
let multiline = #"""
The answer to life,
the universe,
and everything is \#(answer).
"""#

let regex_old = "\\\\[A-Z]+[A-Za-z]+\\.[a-z]+"
let regex = #"\\[A-Z]+[A-Za-z]+\.[a-z]+"#
