
import Foundation

class Economy{
    private var costUpgradeStrenght : Int = 30
    private var costUpgradeWeapon : Int = 1
    private let coefStrentgh : Float = 0.1
    private let coefWeapon : Float = 0.001
    private var strengthDamage : Float
    private var weaponDamage : Float

    init() {
        self.strengthDamage = 1
        self.weaponDamage = 1
    }
    
    func DamageUpgrade(gold : Int) -> Int{
        if(gold >= costUpgradeStrenght){
            self.strengthDamage = strengthDamage + (self.coefStrentgh * strengthDamage)
            self.costUpgradeStrenght += 10
            print("Força atual: \(strengthDamage) e Dano da Arma atual: \(weaponDamage)")
        return costUpgradeStrenght
        }
        return 0
    }
    
    func WeaponUpgrade(gold : Int) -> Int{
        if(gold >= costUpgradeWeapon){
            self.weaponDamage = weaponDamage + (self.coefWeapon * weaponDamage)
            self.costUpgradeWeapon += 1
            print("Força atual: \(strengthDamage) e Dano da Arma atual: \(weaponDamage)")
            return costUpgradeWeapon
        }
        return 0
    }
    
    func GetDamage() -> Float{
        return strengthDamage * weaponDamage
    }
    
}
