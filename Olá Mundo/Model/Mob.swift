import Foundation

class Mob {
    private var lifeSpawn : Float = 10
    private var life : Float

    init(stage : Int) {
        self.life = lifeSpawn + (lifeSpawn * Float(stage) / 10)
    }
    
    func GetLife() -> Float{
        return life
    }
    
    func Spawn(stage : Int){
        life = lifeSpawn + (lifeSpawn * Float(stage) / 10)
        
            print("Ta Saindo da Jaula o Monstro (HP: \(life))")
    }
    
    func Damage (damage : Float){
        print("Oia a pedra !")
        life -= damage
    }
}
