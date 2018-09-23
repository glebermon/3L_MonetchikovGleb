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
enum carSuspension {
    case ressory, pnevmo
}


class Car {
    let model: String
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    let trunkVolume: Double
    var year: Int
    var km: Double
    var doorState: CarDoorState
    var windowsState: WindowsState
    var engineStat: EngineOnOff
    var owner: String
    
    init (model: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, engineStat: EngineOnOff, km: Double, doorState: CarDoorState, windowsState: WindowsState, trunckVolume: Double, owner: String) {
        self.model = model
        self.year = year
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.engineStat = engineStat
        self.km = km
        self.doorState = doorState
        self.trunkVolume = trunckVolume
        self.owner = owner
        self.windowsState = windowsState
    }
    func openWindows() {
        windowsState = .open
    }
    func closeWindows() {
        windowsState = .close
    }
}

var car1 = Car(model: "Toyota Prius", year: 2010, color: .black, mp3: true, transmission: .auto, engineStat: .off, km: 100.2, doorState: .open, windowsState: .close, trunckVolume: 440, owner: "Max")

class TruckCar: Car {
    var suspensionState: carSuspension
    init (model: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, suspensionState: carSuspension, engineStat: EngineOnOff, km: Double, doorState: CarDoorState, windowsState: WindowsState, trunckVolume: Double, owner: String) {
        self.suspensionState = suspensionState
        super.init(model: model, year: year, color: color, mp3: mp3, transmission: transmission, engineStat: engineStat, km: km, doorState: doorState, windowsState: windowsState, trunckVolume: trunckVolume, owner: owner)
    }
}

var truck1 = TruckCar(model: "Mazda Bongo", year: 2000, color: .blue, mp3: false, transmission: .manual, suspensionState: .pnevmo, engineStat: .off, km: 4034.3, doorState: .open, windowsState: .close, trunckVolume: 2000, owner: "Gleb")
