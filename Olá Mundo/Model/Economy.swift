
import Foundation

class Economy{
    private var costUpgradeStrenght : Int = 30
    private var costUpgradeWeapon : Int = 5
    private let coefStrentgh : Float = 0.1
    private let coefWeapon : Float = 0.001
    private var strengthDamage : Float
    private var weaponDamage : Float

    init() {
        self.strengthDamage = 1
        self.weaponDamage = 1
    }
    
    func DamageUpgrade(gold : Int) -> Int{
        var cost = 0
        if(gold >= costUpgradeStrenght){
            self.strengthDamage = strengthDamage + (self.coefStrentgh * strengthDamage)
            cost = costUpgradeStrenght
            self.costUpgradeStrenght += 10
            print("Força atual: \(strengthDamage) e Dano da Arma atual: \(weaponDamage)")
        }
        print("Eu compro uma goiaba ou pego o busao")
        return cost
        
    }
    
    func WeaponUpgrade(gold : Int) -> Int{
        var cost = 0
        if(gold >= costUpgradeWeapon){
            self.weaponDamage = weaponDamage + (self.coefWeapon * weaponDamage)
            cost = costUpgradeWeapon
            
            self.costUpgradeWeapon += 1
            
            print("Força atual: \(strengthDamage) e Dano da Arma atual: \(weaponDamage)")
            
        }
        
        print("Eu compro uma goiaba ou pego o busao")
        return cost
    }
    
    func GetDamage() -> Float{
        return strengthDamage * weaponDamage
    }
    
}
