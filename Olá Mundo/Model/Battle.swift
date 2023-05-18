import Foundation

class Battle {

    private var mob : Mob
    private var player : Player
    private var stageTotalMob = 15
    private var stage_progress = 15
    
    init(mob: Mob, player: Player) {
        self.mob = mob
        self.player = player
    }
    
    func NewBattle(mob: Mob, player: Player){
        self.mob = mob
        self.player = player
    }
    
    func Battle () -> Bool{
        mob.Damage(damage: player.GetDamage())
            
        if(mob.GetLife() <= 0){
            player.EarnReward()
            stage_progress -= 1
            if(stage_progress == 0) {
                player.StageUp()
                stage_progress = stageTotalMob
            }
            mob.Spawn(stage: player.GetStage())
            return true
        }
        return false
    }
}
