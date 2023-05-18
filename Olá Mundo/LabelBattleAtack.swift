import UIKit

class LabelBattleAttack: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        // Configurações personalizadas para a sua UILabel
        self.textColor = UIColor.white
        self.backgroundColor = UIColor.black
        self.isHidden = false
        self.text = "Touch"
    }
}
