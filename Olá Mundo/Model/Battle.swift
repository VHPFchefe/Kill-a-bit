import Foundation

class Battle {
    typealias Stage = Int
    private var economy : Economy
    private(set) var mob : Mob
    private(set) var player : Player
    private(set) var stageTotalMob = 10
    private(set) var stage_progress = 10
    
    
    init(mob: Mob, player: Player, economy : Economy) {
        self.mob = mob
        self.player = player
        self.economy = economy
    }
    
    func NewBattle(mob: Mob, player: Player){
        self.mob = mob
        self.player = player
    }
    
    func GetDamagePlayer() -> Float{
        return player.damage + economy.GetDamage()
    }
    
    func Battle (){
        var stageNow = player.stage
        mob.damage(damage: GetDamagePlayer())
            
        if(mob.life <= 0){
            
            player.EarnReward()
            stage_progress -= 1
            
            if(stage_progress == 0) {
                player.StageUp()
                stage_progress = stageTotalMob
            }
            
            if(stageNow == 1){
                mob = Mob(monster: Mob.Monster.bigRat, stage: player.stage)
            }
            
            mob = Mob(monster: Mob.Monster.rat, stage: player.stage)
        }
        
    }
}
