import UIKit

enum CarDoorState {
    case open, close
}
enum WindowsState {
    case open, close
}
enum Transmission {
    case manual, auto
}
enum CarHatchState {
    case open, close
}
enum EngineOnOff {
    case on, off
}
enum CarSuspension {
    case ressory, pnevmo
}


class Car {
    let model: String
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    let trunkVolume: Double
    var luggage: Double
    var year: Int
    var km: Double
    var doorState: CarDoorState
    var windowsState: WindowsState
    var engineStat: EngineOnOff
    var owner: String = "" {
        willSet {
            print("Previous owner: \(owner)")
        } didSet {
            print("New owner: \(owner)" + "\n")
        }
    }
    var freeSpace: Double { // в литрах
        get {
            var intermediate = trunkVolume - luggage
            if intermediate < 0 {
                intermediate = 0
            } else {
                intermediate = trunkVolume - luggage
            }
            
            return intermediate
        }
        
        set {
            self.luggage = freeSpace
        }
    }
    init (model: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, engineStat: EngineOnOff, km: Double, doorState: CarDoorState, windowsState: WindowsState, trunkVolume: Double, luggage: Double, owner: String) {
        self.model = model
        self.year = year
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.engineStat = engineStat
        self.km = km
        self.doorState = doorState
        self.trunkVolume = trunkVolume
        self.owner = owner
        self.windowsState = windowsState
        self.luggage = luggage
    }
    func openWindows() {
        windowsState = .open
        print("Windows are opened" + "\n")
    }
    func closeWindows() {
        windowsState = .close
        print("Windows are closed" + "\n")
    }
    func putToLuggage(howManyKG: Double) {
        if howManyKG <= trunkVolume {
            luggage = howManyKG
        } else {
            print("Не клади столько. Багажник не закроем" + "\n")
        }
    }
}

class TruckCar: Car {
    // Добавил тип подвески. Рессоры или пневматическая.
    var suspensionState: CarSuspension
    // Наличие пониженной передачи
    let reducedGear: Bool
    // Самосвал или нет
    let tipper: Bool
    // Наличие крана
    let crane: Bool
    
    init (model: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, reducedGear: Bool, suspensionState: CarSuspension,
          tipper: Bool, crane: Bool, engineStat: EngineOnOff, km: Double, doorState: CarDoorState, windowsState: WindowsState, trunkVolume: Double, luggage: Double, owner: String) {
        self.suspensionState = suspensionState
        self.reducedGear = reducedGear
        self.tipper = tipper
        self.crane = crane
        super.init(model: model, year: year, color: color, mp3: mp3, transmission: transmission, engineStat: engineStat, km: km, doorState: doorState, windowsState: windowsState, trunkVolume: trunkVolume, luggage: luggage, owner: owner)
    }
    
    
    // Переписал функцию. теперь можно класть в кузов больше, чем позволяет заявленная грузоподъемность, но лишь с небольшим перевесом.
    override func putToLuggage(howManyKG: Double) {
        if howManyKG <= trunkVolume {
            luggage = howManyKG
        } else if (howManyKG > trunkVolume) && (howManyKG <= (trunkVolume+200)) {
            luggage = howManyKG
            print("Едь помедленнее, у нас перевес на \(luggage - trunkVolume) килограмм" + "\n")
        } else {
            print("Не стоит ехать, коробку спалим - перевес сильно большой" + "\n")
        }
    }
    // Функция, чтобы полностью разгрузить кузов.
    func unloading() {
        luggage = 0
    }
}

var truck1 = TruckCar(model: "Mazda Bongo", year: 2002, color: .blue, mp3: false, transmission: .manual, reducedGear: true, suspensionState: .pnevmo, tipper: false, crane: false, engineStat: .off, km: 4034.3, doorState: .open, windowsState: .close, trunkVolume: 3500, luggage: 1470, owner: "Gleb")
var truck2 = TruckCar(model: "Mazda Titan", year: 2004, color: .white, mp3: true, transmission: .manual, reducedGear: true, suspensionState: .ressory, tipper: true, crane: false, engineStat: .off, km: 50000, doorState: .close, windowsState: .close, trunkVolume: 4500, luggage: 0, owner: "Alexey")
var truck3 = TruckCar(model: "Isuzu Forvard", year: 2006, color: .gray, mp3: true, transmission: .manual, reducedGear: true, suspensionState: .ressory, tipper: false, crane: true, engineStat: .on, km: 10000, doorState: .open, windowsState: .close, trunkVolume: 15000, luggage: 9740.55, owner: "Alexander")

print("=================================================================\n")

// ПОИГРАЕМСЯ С ГРУЗОВИКАМИ

print("========== Кладу в кузов больше чем можно на 500 кг =============\n")
truck1.putToLuggage(howManyKG: 4000) // Кладу в кузов 1ой машины груз на 500 кг больше, чем она може взять.
print("========== Кладу в кузов с небольшим перевесом ==================\n")
truck2.putToLuggage(howManyKG: 4600) // Кладу в кузов 2ой всего на 100 кг перевес.

truck3.luggage // Сейчас посмотрим, чколько в кузове 3й машины и полностью ее разгрузим.
truck3.freeSpace
print("================= Полностью разгружаю кузов =====================\n")
truck3.unloading()
print("Разгрузились. В кузове \(truck3.luggage) кг. Свободного места: \(truck3.freeSpace) кг" + "\n")

print("=================================================================\n")

// ПОИГРАЕМСЯ С ОБЫЧНЫМИ АВТО

var car1 = Car(model: "Toyota Prius", year: 2010, color: .blue, mp3: true, transmission: .auto, engineStat: .on, km: 10000, doorState: .close, windowsState: .open, trunkVolume: 440, luggage: 210, owner: "Max")
var car2 = Car(model: "Toyota Aqua", year: 2015, color: .magenta, mp3: true, transmission: .auto, engineStat: .off, km: 7500, doorState: .open, windowsState: .close, trunkVolume: 200, luggage: 43, owner: "Anton")
var car3 = Car(model: "Honda Fit", year: 2018, color: .lightGray, mp3: false, transmission: .manual, engineStat: .off, km: 0, doorState: .close, windowsState: .close, trunkVolume: 200, luggage: 199, owner: "Mark")

print("================ Посмотрю модель первой машины ==================\n")
print("Car1 model: \(car1.model)\n")
print("================== Закрою окна в 1ой машине =====================\n")
car1.closeWindows()
print("============= Положу в багажник 2й больше чем можно==============\n")
car2.putToLuggage(howManyKG: 300)
print("=================== Поменяю владельца машины ====================\n")
car3.owner = "Gleb"
print("=================================================================\n")




truck1.putToLuggage(howManyKG: 5000)
