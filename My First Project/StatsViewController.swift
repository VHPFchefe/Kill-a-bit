
import UIKit

class StatsViewController : ViewController {
    
    
    var power : String?
    var totalGoldIncome : String?
    var totalBossesDefeated : String?
    var totalMonstersDefeated : String?
    
    
    override func viewDidLoad() {
        title = "Status"
        
        viewPower.text = power
        viewTotalGoldIncome.text = totalGoldIncome
        viewTotalBossesDefeated.text = totalBossesDefeated
        viewTotalMonstersDefeated.text = totalMonstersDefeated
        
    }
    
    @IBOutlet weak var viewPower : UILabel!
    @IBOutlet weak var viewTotalGoldIncome : UILabel!
    @IBOutlet weak var viewTotalMonstersDefeated : UILabel!
    @IBOutlet weak var viewTotalBossesDefeated : UILabel!
    
}
