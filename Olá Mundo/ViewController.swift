import UIKit

class ViewController: UIViewController {

    var battle: Battle!
    var economy: Economy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        economy = Economy()
        battle = Battle(mob: mob, player: playerOnline, economy: economy)
        ViewUpdate()
    }
    
    let playerOnline = Player(name: "Chefe")
    let mob = Mob(stage: 1)
    
    @IBOutlet weak var viewPlayer: UILabel!
    
    @IBOutlet weak var viewLvlProgress: UIProgressView!
    
    @IBOutlet weak var viewGold: UILabel!
    
    @IBOutlet weak var viewStage: UILabel!
    
    @IBOutlet weak var viewLvl: UILabel!
    
    @IBAction func Tap(_ sender: Any) {
        if(battle.Battle()){
            ViewUpdate()
        }
    }
    
    @IBAction func UpgradeStrength(_ sender: Any) {
        economy.DamageUpgrade()
    }
    
    @IBAction func UpgradeWeapon(_ sender: Any) {
        economy.WeaponUpgrade()
    }
    
    func ViewUpdate(){
        viewLvlProgress.setProgress(playerOnline.GetLVLProgress(), animated: true)
        viewLvl.text! = "lvl \(String(playerOnline.GetLvL()))"
        viewGold.text! = "Ouro:  \(String(playerOnline.GetGold()))"
        viewStage.text! = "Fase: \(String(playerOnline.GetStage()))"
        viewPlayer.text! = String(playerOnline.GetName())
    }
}

 
