import Foundation

class Mob {
    private var lifeSpawn : Int = 10
    private var life : Int

    init(stage : Int) {
        self.life = lifeSpawn + (lifeSpawn * stage / 10)
    }
    
    func GetLife() -> Int{
        return life
    }
    
    func Spawn(stage : Int){
        life = lifeSpawn + (lifeSpawn * stage / 10)
        
            print("Ta Saindo da Jaula o Monstro (HP: \(life))")
    }
    
    func Damage (damage : Int){
        print("Oia a pedra !")
        life -= damage
    }
}
