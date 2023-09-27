//
//  Player.swift
//  Olá Mundo
//
//  Created by Vinicius Floriano on 17/05/23.
//

import Foundation

class Player : RewardPlayer {
    private(set) var name : String
    private(set) var damage : Float
    private(set) var lvl : Int
    private(set) var lvlProgress : Float
    private(set) var gold : Int
    private(set) var stage : Int
    private(set) var stageProgress : Int
    private(set) var totalPower: Float
    private(set) var totalGoldIncome: Int
    private(set) var totalMonstersDefeated: Int
    private(set) var totalBossesDefeated: Int
    
    
    init(name: String) {
        self.name = name
        self.lvl = 1
        self.lvlProgress = 0.0000001
        self.damage = 0
        self.gold = 0
        self.stage = 1
        self.stageProgress = 0
        self.totalPower = 0
        self.totalGoldIncome = 0
        self.totalBossesDefeated = 0
        self.totalMonstersDefeated = 0
    }
    
        func EarnReward( isMonster : Bool ) {
        
        let rewardGold = Int(1+self.stage / 10)
        print("Lucrou \(rewardGold) !")
        
        let coeflvl = 1/(100 * Float(lvl))
        let rewardLvLProgress = Float(0.01 + coeflvl * Float(stage))
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
        if(isMonster){
            self.totalMonstersDefeated += 1
        }else  {
            self.totalBossesDefeated += 1
        }
        totalPower = damage
        totalGoldIncome += rewardGold
    }
    
    func Invest(costGold : Int){
        self.gold -= costGold
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
}
