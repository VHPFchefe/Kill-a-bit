import Foundation

class Battle {

    private var mob : Mob
    private var player : Player
    
    init(mob: Mob, player: Player) {
        self.mob = mob
        self.player = player
    }
    
    func NewBattle(mob: Mob, player: Player){
        self.mob = mob
        self.player = player
    }
    
    func Battle (){
        mob.Damage(damage: player.GetDamage())
        if(mob.GetLife() <= 0){
            player.EarnReward()
            mob.Spawn(stage: player.GetStage())
        }
    }
}
