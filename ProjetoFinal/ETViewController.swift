//
//  ETViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 14/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit

class ETViewController: UIViewController {

    @IBOutlet weak var textAlien: UITextView!
    
    @IBOutlet weak var botaoProsseguir: UIButton!
    
    @IBOutlet weak var botaoDerrota: UIButton!
    
    @IBOutlet weak var botaoProximaTela: UIButton!
    
    @IBOutlet weak var labelTempo: UILabel!
    
    @IBOutlet weak var labelPontos: UILabel!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var botao1: UIButton!
    @IBOutlet weak var botao2: UIButton!
    @IBOutlet weak var botao3: UIButton!
    @IBOutlet weak var botao4: UIButton!
    @IBOutlet weak var botao5: UIButton!
    @IBOutlet weak var botao6: UIButton!
    @IBOutlet weak var botao7: UIButton!
    @IBOutlet weak var botao8: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNome.text = Model.instance.nome
        textAlien.text = "Olá, humano. Vejo que foi muito bravo para chegar até aqui, superou desafios de variados tipos. Para este último estágio eu lhe proponho um desafio de velocidade e atenção."
        resetaBotoes()
        labelTempo.isHidden = true
        labelPontos.isHidden = true
        botaoDerrota.isHidden = true
        botaoProximaTela.isHidden = true
        Model.instance.fase = .alien
        // Do any additional setup after loading the view.
    }
    
    var count = 0
    
    //variavel que verifica se o jogador acertou o botao que pipocou na tela ou n
    var acertou = false
    
    // variavel que indica se o jogador venceu ou n~~ao
    var ganhou = false
    
    // indica quantos pontos o jogador fez no game
    var pontos = 0
    
    //variavel que indica se o tempo acabou ou não
    var tempoAcabou = false
    
    
    @IBAction func botao1Action(_ sender: UIButton) {
        acertou = true
    }
    
    @IBAction func botao2Action(_ sender: UIButton) {
        acertou = true
        
    }
    
    @IBAction func botao3Action(_ sender: UIButton) {
        acertou = true
    }
    
    
    @IBAction func botao4Action(_ sender: UIButton) {
        acertou = true
    }
    
    @IBAction func botao5Action(_ sender: UIButton) {
        acertou = true
    }
    
    @IBAction func botao6Action(_ sender: UIButton) {
        acertou = true
    }
    
    @IBAction func botao7Action(_ sender: UIButton) {
        acertou = true
    }
    
    
    @IBAction func botao8Action(_ sender: UIButton) {
        acertou = true
    }
    
    
    @IBAction func botaoProsseguirAction(_ sender: UIButton) {
        
        
        switch count {
        case 0:
            textAlien.text = "Clique no máximo de botões que puder conforme eles aparecem na tela, você tem 30 segundo para marcar 10 pontos."
            botaoProsseguir.setTitle("Começar", for: .normal)
            count += 1
        case 1:
            setarTimerGeral(intervalo: 30)
            game()
            botaoProsseguir.isHidden = true
            
        default: break
        }
    
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Seta o timer geral, ou seja, aquele que corre limitando o tempo do jogador fazer os pontos necessarios
    func setarTimerGeral(intervalo: Int) {
        labelTempo.text = "Tempo"
        var contador = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            
            if self.ganhou {
                timer.invalidate()
            }
            
            if intervalo == contador {
                self.resetaBotoes()
                self.botaoDerrota.isHidden = false
                self.botaoProsseguir.isHidden = true
                self.tempoAcabou = true
                self.textAlien.text = "Tempo esgotado!Você não atingiu a pontuação necessária, humano. Treine mais esses reflexos de lesma"
                timer.invalidate()
                self.labelTempo.isHidden = true
            }
            
            self.labelTempo.isHidden = false
            self.labelTempo.text = "Tempo\nrestante:\n\(intervalo - contador)s"
            contador += 1
        
        }
    }
    
    
    // sorteia o botao que sera pipocado na tela e o mostra por 0.4 segundos e depois sorteia outro, isso se o tempo não ou o jogador ganahr
    func game() {
        //var control = true
        self.labelPontos.isHidden = false
        self.labelPontos.text = "Pontos:\n\(self.pontos)"
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { (timer) in
            
            //verifica se ainda há tempo
            if self.tempoAcabou {
                timer.invalidate()
                self.resetaBotoes()
            }
            
            //sorteia o btao que vai piscar e mostra-o
            if  !self.tempoAcabou {
            var botaoAtivo:UIButton
            self.resetaBotoes()
            botaoAtivo = self.sorteiaBotao()
            botaoAtivo.isHidden = false
            
            }
            
            //verifica se o jogador acertou
            if self.acertou {
                print(self.pontos)
                self.pontos += 1
                self.labelPontos.text = "Pontos:\n\(self.pontos)"
                
                //verifica se o jogador já ganhou
                if self.pontos == 10 {
                    self.textAlien.text = "Você conseguiu! Parabéns humano, chegou ao final da aventura"
                    self.botaoProximaTela.isHidden = false
                    self.resetaBotoes()
                    self.ganhou = true
                    timer.invalidate()
                    
                }
                
                //variavel acertou volta a ser falsa apos o jogador acertar
                self.acertou = false
            
                
            }
        }
        
    }
    
    
    //sorteia um dos botoes para ser mostrado
    func sorteiaBotao() -> UIButton {
        let numeroBotao = Int.random(in: 1...8)
        switch numeroBotao {
        case 8:
            return botao8
        case 7:
            return botao7
        case 6:
            return botao6
        case 5:
            return botao5
        case 4:
            return botao4
        case 3:
            return botao2
        case 2:
            return botao3
        case 1:
            return botao1
        default:
            return botao2
        }
    }
    
    func resetaBotoes() {
        botao8.isHidden = true
        botao7.isHidden = true
        botao6.isHidden = true
        botao5.isHidden = true
        botao4.isHidden = true
        botao3.isHidden = true
        botao2.isHidden = true
        botao1.isHidden = true
        
    }
    
    
    
}
