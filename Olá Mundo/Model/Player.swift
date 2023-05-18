//
//  Player.swift
//  Olá Mundo
//
//  Created by Vinicius Floriano on 17/05/23.
//

import Foundation

class Player : RewardPlayer {
    private var name : String
    private var damage : Int
    private var lvl : Int
    private var lvlProgress : Float
    private var gold : Int
    private var stage : Int
    private var stageProgress : Int
    
    init(name: String) {
        self.name = name
        self.lvl = 1
        self.lvlProgress = 0.0000001
        self.damage = 1
        self.gold = 0
        self.stage = 1
        self.stageProgress = 0
    }
    
    override func EarnReward() {
        let rewardGold = Int(1+self.stage / 10)
        // compilador n guento, então vou quebrar esses coef aqui
        let coeflvl = 1/(100 * Float(lvl))
        let rewardLvLProgress = Float(0.09 + coeflvl * Float(stage))
        print("Lucrou \(rewardGold) !")
        print("Progrediu \(rewardLvLProgress)%")
        
        self.lvlProgress += rewardLvLProgress
        if(self.lvlProgress == 1){
            self.lvlProgress = 0
            LvLUp()
        }
        if(self.lvlProgress > 1){
            let driftLvlProgress : Float = self.lvlProgress - Float(1)
            // compilador n guento, então vou quebrar esses coef aqui
            let coefSobraDoLevelAnterior = driftLvlProgress * Float(100)
            self.lvlProgress = coeflvl * coefSobraDoLevelAnterior
            LvLUp()
        }
        
        self.gold += rewardGold
    }
    
    func StageUp(){
        self.stage += 1
        print("Bora Bill, Fase :  \(self.stage)")
    }
    
    func LvLUp(){
        self.lvl += 1
        self.damage += 1
        print("Evouluiu 1 LVL, agora está no LVL \(self.lvl)")
        print("Ta usando bomba ?  Seu dano agora é \(self.damage)")
    }
    
    func GetDamage() -> Int{
        return damage
    }
    
    func GetGold() -> Int{
        return gold
    }
    
    func GetLvL() -> Int{
        return lvl
    }

    func GetLVLProgress() -> Float{
        return lvlProgress
    }
    
    func GetName() -> String {
        return name
    }
    
    func GetStage() -> Int{
        return stage
    }
}
