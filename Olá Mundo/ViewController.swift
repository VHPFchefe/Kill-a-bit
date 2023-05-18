import UIKit

class ViewController: UIViewController {

    var battle: Battle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        battle = Battle(mob: mob, player: playerOnline)
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
        battle.Battle()
        ViewUpdate()
    }
    
    func ViewUpdate(){
        viewLvlProgress.setProgress(playerOnline.GetLVLProgress(), animated: true)
        viewLvl.text! = "lvl \(String(playerOnline.GetLvL()))"
        viewGold.text! = "Ouro:  \(String(playerOnline.GetGold()))"
        viewStage.text! = "Fase: \(String(playerOnline.GetStage()))"
        viewPlayer.text! = String(playerOnline.GetName())
    }
}

 
