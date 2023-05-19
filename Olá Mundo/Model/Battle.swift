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
    
    func GetDamagePlayer() -> Float{
        return player.GetDamage() + economy.GetDamage()
    }
    
    func Battle (){
        var stageNow = player.GetStage()
        mob.Damage(damage: GetDamagePlayer())
            
        if(mob.GetLife() <= 0){
            
            player.EarnReward()
            stage_progress -= 1
            
            if(stage_progress == 0) {
                player.StageUp()
                stage_progress = stageTotalMob
            }
            
            if(stageNow < player.GetStage()){
                mob.GrowthMob(stage: player.GetStage())
                
            }
            
            mob.Spawn()
            
        }
        
    }
}
