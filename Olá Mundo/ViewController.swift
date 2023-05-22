import UIKit

class ViewController: UIViewController {

    
  let font : UIFont = UIFont(name: "Arial", size: 18) ?? UIFont.systemFont(ofSize: 18)
    let playerOnline = Player(name: "Chefe")
    var battle: Battle!
    var mob = Mob(stage: 1)
    var timer: Timer?
    var economy: Economy!
    var viewLabelBattle : LabelBattleAttack!
    func ViewUpgradesUpdates(font : UIFont){
        
        ViewUpdate()
        viewUpgradeWeapon.setTitle("LvL + Arsenal \(economy.GetCostUpgradeWeapon()) (g)", for: .normal)
        viewUpgradeStrength.setTitle("LvL + Força \(economy.GetCostUpgradeStrength()) (g)", for: .normal);

        viewUpgradeStrength.titleLabel?.textAlignment = .center
        viewUpgradeWeapon.titleLabel?.textAlignment = .center
            
        viewUpgradeStrength.titleLabel?.font = font
        viewUpgradeWeapon.titleLabel?.font = font
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        economy = Economy()
        battle = Battle(mob: mob, player: playerOnline, economy: economy)

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                viewControl.addGestureRecognizer(tapGesture)

        ViewUpgradesUpdates(font: font)
    }
    
    
    @IBOutlet weak var viewPlayer: UILabel!
    
    @IBOutlet weak var viewLvlProgress: UIProgressView!
    
    @IBOutlet weak var viewGold: UILabel!
    
    @IBOutlet weak var viewStage: UILabel!
    
    @IBOutlet weak var viewLvl: UILabel!
    
    @IBOutlet weak var viewLife : UILabel!
    
    @IBOutlet weak var Book: UIButton!
    
    @IBAction func OpenTheThecaBook(_ sender: Any) {
        
    }
    
    @IBAction func Tap(_ sender: Any) {
        battle.Battle()
        ViewUpdate()
    }
    
    @IBAction func UpgradeStrength(_ sender: Any) {
        playerOnline.Invest(costGold: economy.DamageUpgrade(gold: playerOnline.gold))
        ViewUpgradesUpdates(font: font)
    }
    
    @IBAction func UpgradeWeapon(_ sender: Any) {
        playerOnline.Invest(costGold:  economy.WeaponUpgrade(gold: playerOnline.gold))
        ViewUpgradesUpdates(font: font)
    }
    
    @IBOutlet weak var viewDamage : UILabel!
    
    @IBOutlet weak var viewControl : UIControl!
    
    @IBOutlet weak var viewLifeMob : UIProgressView!
    
    @IBOutlet weak var viewUpgradeStrength: UIButton!
    
    @IBOutlet weak var viewUpgradeWeapon: UIButton!
    
    func ViewUpdate(){
        viewLvlProgress.setProgress(playerOnline.lvlProgress, animated: true)
        viewLvl.text! = "lvl \(String(playerOnline.lvl))"
        viewGold.text! = "Ouro:  \(String(playerOnline.gold)) (g)"
        viewStage.text! = "Fase: \(String(playerOnline.stage))"
        viewPlayer.text! = String(playerOnline.name)
        viewLifeMob.setProgress(mob.lifeSpawn / 100 * mob.life, animated: false)
        viewLife.text = "\(String(format: "%.1f", mob.life)) / \(String(format: "%.1f", mob.lifeSpawn))"
        viewDamage.text! = "Dano =  \(String(format: "%.1f", battle.GetDamagePlayer()))"
        print(mob.life)
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
      
        // Configura o temporizador
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(removeCustomView), userInfo: nil, repeats: false)
        
    }
    
    @objc func removeCustomView() {
        // Remove a View da hierarquia de views
        viewLabelBattle?.removeFromSuperview()
    }
    
}

 
