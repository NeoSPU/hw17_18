//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// ------------------------- #1 -----------------------------
print("------------------------- #1 -----------------------------\n")
var printClosure: () -> Void

printClosure = {
    return print("I love Swift")
}

printClosure()

// ------------------------- #2 -----------------------------
print("\n------------------------- #2 -----------------------------\n")

func repeatTask(items: Int, task: () -> Void) {
    var items = items
    while items > 0 {
        task()
        items -= 1
    }
}
repeatTask(items: 10, task: printClosure)

// ------------------------- #3 -----------------------------
print("\n------------------------- #3 -----------------------------\n")

var calculateCircumference: (Float) -> Float
calculateCircumference = { (rad: Float) -> Float in
    return 2 * Float.pi * rad
}

print("\(calculateCircumference(4.0))")
