import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var battle: Battle!
    var economy: Economy!
    var viewLabelBattle : LabelBattleAttack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        economy = Economy()
        battle = Battle(mob: mob, player: playerOnline, economy: economy)
        ViewUpdate()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                viewControl.addGestureRecognizer(tapGesture)
        
        
        
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
        playerOnline.Invest(costGold: economy.DamageUpgrade(gold: playerOnline.GetGold()))
        ViewUpdate()
    }
    
    @IBAction func UpgradeWeapon(_ sender: Any) {
        playerOnline.Invest(costGold:  economy.WeaponUpgrade(gold: playerOnline.GetGold()))
        ViewUpdate()
    }
    
    @IBOutlet weak var viewControl : UIControl!
    
    
    func ViewUpdate(){
        viewLvlProgress.setProgress(playerOnline.GetLVLProgress(), animated: true)
        viewLvl.text! = "lvl \(String(playerOnline.GetLvL()))"
        viewGold.text! = "Ouro:  \(String(playerOnline.GetGold()))"
        viewStage.text! = "Fase: \(String(playerOnline.GetStage()))"
        viewPlayer.text! = String(playerOnline.GetName())
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
           guard let viewControl = gesture.view else { return }
           
       let touchPoint = gesture.location(in: viewControl)
       // A posição do toque é dada por `touchPoint`
        
        // remove os elementos gráficos dos toques anteriores
        removeCustomView()
        
       // Exemplo de utilização da posição do toque:
       //print("Posição do toque: \(touchPoint)")
        
        viewLabelBattle = LabelBattleAttack(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        viewLabelBattle.frame.origin = touchPoint
        viewControl.addSubview(viewLabelBattle)
      
        // Configura o temporizador para remover a View após 1 segundo
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(removeCustomView), userInfo: nil, repeats: false)
    }
    
    @objc func removeCustomView() {
        // Remove a View da hierarquia de views
        viewLabelBattle?.removeFromSuperview()
    }
    
}

 
