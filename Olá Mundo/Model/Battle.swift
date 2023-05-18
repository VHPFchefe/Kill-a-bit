import Foundation

class Battle {
    private var economy : Economy
    private var mob : Mob
    private var player : Player
    private var stageTotalMob = 10
    private var stage_progress = 10
    
    
    init(mob: Mob, player: Player, economy : Economy) {
        self.mob = mob
        self.player = player
        self.economy = economy
    }
    
    func NewBattle(mob: Mob, player: Player){
        self.mob = mob
        self.player = player
    }
    
    func Battle () -> Bool{
        mob.Damage(damage: player.GetDamage() + economy.GetDamage())
            
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
