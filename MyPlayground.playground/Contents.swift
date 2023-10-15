
protocol Cannons {
    var cannonCount: Int { get }
    func fireCannon(count: Int)
}

class PirateShip: Cannons {
    var cannonCount: Int
    let name: String
    
    private let crewManager: CrewManaging
    private let cargoManager: CargoManaging
    
    init(name: String, cannonCount: Int, crewManager: CrewManaging, cargoManager: CargoManaging) {
        self.name = name
        self.cannonCount = cannonCount
        self.crewManager = crewManager
        self.cargoManager = cargoManager
    }
    
    // აქ არვიცი ამდენი ფუნქცია უნდა მქონდეს თუარა, მეორე ვარიანტი მქონდა, რომ crewManager და cargoManager private არ ყოფილიყვნენ მასეც მუშაობს, უბრალოდ მაგ შემთხვევაში PirateShip class ში ამდენი ფუნქციის ჩაყრა არ მიწევს.
    func fireCannon(count: Int) {
        cannonCount -= count
    }
    
    func addCargo(item: String) {
        cargoManager.addCargo(cargoItem: item)
    }
        
    func removeCargo(item: String) {
        cargoManager.removeCargo(cargoItem: item)
    }
        
    func listCargo() {
        cargoManager.listCargo()
    }
        
    func addCrew(crewMember: String) {
        crewManager.addCrew(crewMember: crewMember)
    }
        
    func removeCrew(crewMember: String) {
        crewManager.removeCrew(crewMember: crewMember)
    }
    
    func listCrew() {
        crewManager.listCrew()
    }
}

protocol CargoManaging {
    
    func addCargo(cargoItem: String)
    func removeCargo(cargoItem: String)
    func listCargo()
    
}

protocol CrewManaging {
    func addCrew(crewMember: String)
    func removeCrew(crewMember: String)
    func listCrew()
}

class CargoManager: CargoManaging {
    private var cargo: [String] = []
    
    
    func addCargo(cargoItem: String) {
        cargo.append(cargoItem)
    }
    
    func removeCargo(cargoItem: String) {
        cargo.filter { $0 != cargoItem}
    }
    
    func listCargo() {
        let cargoCopy = cargo.map { $0 }
        print(cargoCopy)
    }
    
}

class CrewManager: CrewManaging {
    private var crew: [String] = []
    
    func addCrew(crewMember: String) {
        crew.append(crewMember)
    }
    
    func removeCrew(crewMember: String) {
        crew.filter { $0 != crewMember}
    }
    
    func listCrew() {
        // აქ უბრალოდ $0 ის გამოყენება მინდოდა :D
        let crewCopy = crew.map { $0 }
        print(crewCopy)
    }
    
}


class Frigate: PirateShip {
    var torpedoCount: Int
    
    init(name: String, crewManager: CrewManaging, cargoManager: CargoManaging, cannonCount: Int, torpedoCount: Int) {
        self.torpedoCount = torpedoCount
        super.init(name: name, cannonCount: cannonCount, crewManager: crewManager, cargoManager: cargoManager)
    }
    
    override func fireCannon(count: Int) {
        torpedoCount -= count
        print("fired \(count) torpedos")
    }
}

class Galleon: PirateShip {
    var ballisticMissileCount: Int
    
    init(name: String, crewManager: CrewManaging, cargoManager: CargoManaging, cannonCount: Int, ballisticMissileCount: Int) {
        self.ballisticMissileCount = ballisticMissileCount
        super.init(name: name, cannonCount: cannonCount, crewManager: crewManager, cargoManager: cargoManager)
    }
    
    override func fireCannon(count: Int) {
        ballisticMissileCount -= count
        print("fired \(count) Ballistic Missiles")
    }
}


class TreasureMap {
    private var x: Int
    private var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(xAxis: Int, yAxis: Int) {
        if xAxis == x && yAxis == y {
            print("you found the Treasure!!!! ur rich now son")
        }else if xAxis == x{
            print("x coordinate is correct but y is not")
        }else if yAxis == y{
            print("y coordinate is correct but x is not")
        } else {
            print("you are far from treasure try other coordinates")
        }
    }
    
}

class SeaAdventure {
    var adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("encountered \(adventureType)")
    }
}


class PirateCode {
    
    private func discussTerms(term: String) {
        print("negotiation started \(term)")
    }
    
    func parley(term: String) {
        discussTerms(term: term)
        print("agreement")
    }
    
    func mutiny(term: String) {
        discussTerms(term: term)
        print("batten down the hatches")
    }
    
}

let cargoManager = CargoManager()
let crewManager = CrewManager()

let jollyRoger = PirateShip(name: "Jolly Roger", cannonCount: 10, crewManager: crewManager, cargoManager: cargoManager)

jollyRoger.addCargo(item: "Vase")
jollyRoger.addCargo(item: "Gold")
jollyRoger.addCargo(item: "Knife")

jollyRoger.listCargo()

jollyRoger.addCrew(crewMember: "Ele")
jollyRoger.addCrew(crewMember: "Vako")
jollyRoger.addCrew(crewMember: "Tako")
jollyRoger.addCrew(crewMember: "Jeko")

jollyRoger.listCrew()

let treasureMap = TreasureMap(x: 10, y: 25)

let pirateCode = PirateCode()

let seaAdventure = SeaAdventure(adventureType: "FlyingDutchman")

var startingX: Int = 10
var startingY: Int = 25

treasureMap.hintToTreasure(xAxis: startingX, yAxis: startingY)

seaAdventure.encounter()

pirateCode.mutiny(term: "\(seaAdventure.adventureType) wants money and he gives us save passage")

