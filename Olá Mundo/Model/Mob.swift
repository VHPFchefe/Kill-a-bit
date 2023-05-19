import Foundation

class Mob {
    private var lifeSpawn : Float = 10
    private var life : Float

    init(stage : Int) {
        self.life = lifeSpawn//lifeSpawn + (lifeSpawn * Float(stage) / 10)
    }
    
    func GetLife() -> Float{
        return life
    }
    
    func GetLifeSpawn() -> Float{
        return lifeSpawn
    }
    
    func Spawn(){
        life = lifeSpawn
        
            print("Ta Saindo da Jaula o Monstro (HP: \(life))")
    }
    
    func GrowthMob(stage : Int){
            lifeSpawn += (lifeSpawn * Float(stage) / 50)
    }
    
    func Damage (damage : Float){
        print("Oia a pedra ! Dano: \(damage)")
        life -= damage
    }
}
