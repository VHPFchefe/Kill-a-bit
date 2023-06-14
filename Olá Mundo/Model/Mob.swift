import Foundation

class Mob {
    typealias Stage = Int
    
    var monster: Monster
    private let baseXp: Float = 0.001
    private(set) var lifeSpawn: Float
    private(set) var life: Float

    init(monster: Monster, stage: Stage) {
        self.monster = monster
        /*lifeSpawn = 1
        life = 1*/
        let nIsOneCaseWhenStageIsBetterOne = stage == 1 ? 0:1
        lifeSpawn = (0.05 * (Float(stage - (nIsOneCaseWhenStageIsBetterOne))) * monster.baseLife) + monster.baseLife
        life = lifeSpawn
        print("Ta Saindo da Jaula o Monstro (HP: \(life))")
    }
    
    func damage(damage : Float){
        print("Oia a pedra ! Dano: \(damage)")
        life -= damage
    }
    
    func rewardXp(atStage stage: Stage) -> Float {
        return baseXp * Float(stage)
    }
}
