import Foundation

class Battle {
    typealias Stage = Int
    private var economy : Economy
    private(set) var mob : Mob
    private(set) var player : Player
    private(set) var stageProgress = 10
    private(set) var mobsDefeated = 0
    
    
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
        mob.damage(damage: GetDamagePlayer())
            
        if(mob.life <= 0){
            
            
            
            if(mobsDefeated == 10){
                mob = Mob(monster: Mob.Monster.bigRat, stage: player.stage)
                return
            }
            
            
            if(stageProgress == 11) {
                player.StageUp()
                player.EarnReward(isMonster: true)
            }
            
            player.EarnReward(isMonster: true)
            mobsDefeated += 1
            mob = Mob(monster: Mob.Monster.rat, stage: player.stage)
            print(mob.life)
        }
        
    }
}
