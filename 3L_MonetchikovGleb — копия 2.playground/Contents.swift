import UIKit

enum toyotaWindowState {
    case open, close
}
enum model {
    case Corolla, Camry, Prius, LandCruiser
}
enum engineOnOff {
    case on, off
}

struct Toyota {
    let model: model
    let year: Int
    let color: UIColor
    var engineStat: engineOnOff
    var windowState: toyotaWindowState
    let trunkVolume: Double // в литрах
    var luggage: Double // в литрах
    var freeValue: Double { // в литрах
        get {
            if trunkVolume - luggage >= Double(0) {
                
            } else {
                fatalError("Нелзья положить больше веместимости багажника")
            }
            return trunkVolume - luggage
        }
        

        set {
            self.luggage = freeValue
        }
        }
    var owner: String = "" {
        willSet {
            print("Previous owner: \(owner)")
        } didSet {
            print("New owner: \(owner)" + "\n")
        }
    }
    // methods
    mutating func engineStart(turnKey: String) {
        if turnKey == "on" {
            self.engineStat = .on
        } else {
            self.engineStat = .off
        }
    }
    mutating func closeWindows(closeAllWindows: Int) { // 1 close, else - open
        if closeAllWindows == 1 {
            self.windowState = .close
            print("Windows are closed" + "\n")
        } else {
            self.windowState = .open
            print("Windows are opened" + "\n")
        }
    }
    mutating func putToLuggage (howManyKG: String) { // просто практиковал проверку на nill и перевод строки в число
        let weight: Double? = Double(howManyKG)
        if var test = weight {
        test = weight!
        self.luggage = test
        } else {
            fatalError("Вес не может быть указан текстом! Введи число")
        }
        
}
}

var car1 = Toyota(model: .Prius, year: 2010, color: .black, engineStat: .off, windowState: .close, trunkVolume: 440, luggage: 239, owner: "Max Boyarkin")
var car2 = Toyota(model: .LandCruiser, year: 2017, color: .cyan, engineStat: .off, windowState: .close, trunkVolume: 909, luggage: 340.5, owner: "Gleb Monetchikov")
var car3 = Toyota(model: .Corolla, year: 1999, color: .green, engineStat: .on, windowState: .close, trunkVolume: 200, luggage: 50, owner: "Alexey Nuichev")
var car4 = Toyota(model: .Camry, year: 2018, color: .clear, engineStat: .off, windowState: .close, trunkVolume: 500, luggage: 0, owner: "Gleb Monetchikov")

print("Model: Toyota \(car1.model)" + "\n")
print("Free space in the trunk \(car1.freeValue) liters" + "\n") // оставшееся свободное место
car1.owner = "Gleb Monetchikov"
car1.color
car1.engineStart(turnKey: "on") // запуск двигателя
print("Engine status: \(car1.engineStat)" + "\n")
car1.closeWindows(closeAllWindows: 1)
car1.putToLuggage(howManyKG: "300") // кладу в багажник 300 кг
print("Free space in the trunk \(car1.freeValue) liters" + "\n") // оставшееся свободное место


print("================================================================")
print("\n")



enum gruzModel {
    case MazdaTitan, MazdaBongo, ToyotaDyna, ToyotaHiace
}

struct Gruzovik {
    let model: gruzModel
    let year: Int
    let color: UIColor
    var engineStat: engineOnOff
    var windowState: toyotaWindowState
    let trunkVolume: Double // кг
    var luggage: Double // кг
    var freeValue: Double { // кг
        get {
            let intermediate = trunkVolume - luggage
            var freeSpace: Double = intermediate
            if intermediate >= 0 {
            } else {
                freeSpace = (intermediate * (-1) + trunkVolume)
                print("Overweight \(intermediate * (-1)) KG" + "\n") // покажет нам перевес в кузове, но не остановит программу
            }
            return freeSpace
        }
        
        
        set {
            self.luggage = freeValue
        }
    }
    var owner: String = "" {
        willSet {
            print("Previous owner: \(owner)")
        } didSet {
            print("New owner: \(owner)" + "\n")
        }
    }
    // methods
    mutating func engineStart(turnKey: String) {
        if turnKey == "on" {
            self.engineStat = .on
        } else {
            self.engineStat = .off
        }
    }
    mutating func closeWindows(closeAllWindows: Int) { // 1 close, else - open
        if closeAllWindows == 1 {
            self.windowState = .close
            print("Windows are closed" + "\n")
        } else {
            self.windowState = .open
            print("Windows are opened" + "\n")
        }
    }
    mutating func putToLuggage (howManyKG: Double) {
       self.luggage = howManyKG
        
    }
}

var gruz1 = Gruzovik(model: .ToyotaDyna, year: 1990, color: .blue, engineStat: .off, windowState: .close, trunkVolume: 1500, luggage: 650, owner: "Gleb Monetchikov")
var gruz2 = Gruzovik(model: .MazdaBongo, year: 2010, color: .green, engineStat: .on, windowState: .close, trunkVolume: 2000, luggage: 940, owner: "Max Boyarkin")


gruz1.putToLuggage(howManyKG: 1600)
print("Лежит кузове \(gruz1.freeValue) КГ")
