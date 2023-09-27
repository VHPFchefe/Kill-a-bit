
import UIKit

class StatsViewController : ViewController {
    
    
    var poder : String?
    var totalOuroObtido : String?
    var totalMonstrosAbatidos : String?
    var totalChefesAbatidos : String?
    
    
    override func viewDidLoad() {
        title = "Status"
        
        viewPoder.text = poder
        viewTotalOuroObtido.text = totalOuroObtido
        viewTotalChefesAbatidos.text = totalChefesAbatidos
        viewTotalMonstrosAbatidos.text = totalMonstrosAbatidos
        
    }
    
    @IBOutlet weak var viewPoder : UILabel!
    @IBOutlet weak var viewTotalOuroObtido : UILabel!
    @IBOutlet weak var viewTotalMonstrosAbatidos : UILabel!
    @IBOutlet weak var viewTotalChefesAbatidos : UILabel!
    
}
