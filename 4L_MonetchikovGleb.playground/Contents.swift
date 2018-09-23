import UIKit

enum HondaDoorState {
    case open, close
}
enum Transmission {
    case manual, auto
}
enum HondaHatchState {
    case open, close
}


class Car {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    }
}
class HondaSport: Car {
    var hatchState: HondaHatchState      // Новое свойство
    // Перечисляем все свойства
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState, hatchState: HondaHatchState) {
        self.hatchState = hatchState    // инициализируем новое свойство
        // используем конструктор из родителя, чтобы завершить инициализацию класса
        super.init(color: color, mp3: mp3, transmission: transmission, km: km, doorState: doorState)
    }
    
    func openHatch() {                  // Новый метод
        hatchState = .open
    }
    
    func closeHatch() {                // Новый метод
        hatchState = .close
    }
}
var car1 = Car(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var sportCar1 = HondaSport(color: .red, mp3: true, transmission: .manual, km: 0.0, doorState: .close, hatchState: .close)

class DecorativeHondaSport: HondaSport {
    override func openHatch() {
        print("Пиииип, открывать люк запрещено")
    }
}
var superSportCar = DecorativeHondaSport(color: .black, mp3: false, transmission: .manual, km: 100.50, doorState: .close, hatchState: .open)
superSportCar.openHatch()
sportCar1.openHatch()
superSportCar.closeHatch()
superSportCar.hatchState
superSportCar.openHatch()
superSportCar.hatchState


class Man {
    var myPassport: Passport?
    deinit{     // выведем в консоль сообщение о том, что объект удален
        print ("мужчина удален из памяти")
    }
}
class Passport {
    unowned let man: Man
    init(man: Man) {
        self.man = man
    }
    deinit{     // выведем в консоль сообщение о том, что объект удален
        print("паспорт удален из памяти")
    }
}
var man: Man? = Man()
var passport: Passport? = Passport(man: man!)
//passport = nil // объект еще не удален, его удерживает мужчина
man = nil     // теперь удалены оба объекта

