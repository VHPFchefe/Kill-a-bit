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
        // Cria um atributo de texto para o estilo desejado
        let atributos: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 24), // Definição da fonte em negrito
            .foregroundColor: UIColor.red // Definição da cor do texto
        ]

        // Cria um NSAttributedString com o texto e os atributos
        let attributedText = NSAttributedString(string: "Tap", attributes: atributos)

        // Define o atributo de texto na UILabel
        self.attributedText = attributedText
    }
    
    
    
}
