//
//  DragaoViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 14/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit


class DragaoViewController: UIViewController {
    
    
    @IBOutlet weak var dragaoTexto: UITextView!
    
    @IBOutlet weak var botaoProximaFase: UIButton!
    
    
    @IBOutlet weak var botaoEscolherOutlet: UIButton!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var opcao1botao: UIButton!
    @IBOutlet weak var opcao2botao: UIButton!
    @IBOutlet weak var opcao3botao: UIButton!
    @IBOutlet weak var opcao4botao: UIButton!
    
    
    @IBOutlet weak var botaoPerdeu: UIButton!
    @IBOutlet weak var personImagem: UIImageView!
    
    
    //varia de 0 a 4 de acorco com a opção selecionada
    var opcaoEscolhida = 0
    
    
    var count = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.nome = "Victor"
        labelNome.text = Model.instance.nome
        dragaoTexto.isEditable = false
        Model.instance.fase = .dragao
        botaoProximaFase.isHidden = true
        botaoPerdeu.isHidden = true
        esconderBotoes()
        dragaoTexto.text = "Olá, ser inferior, para passar por mim terá que ter conhecimentos sobre os meus semelhantes do seu mundo."
        
        // Do any additional setup after loading the view.
    }
    
    
    //quando o botao é clicado selecionamos a opção que ele se refere e ele fica amarelo
    @IBAction func opcao1action(_ sender: UIButton) {
        resetaCorBotoes()
        opcao1botao.backgroundColor = .systemYellow
        opcaoEscolhida = 1
        botaoEscolherOutlet.isHidden = false
    }
    
    @IBAction func opcao2Action(_ sender: UIButton) {
        resetaCorBotoes()
        opcao2botao.backgroundColor = .systemYellow
        opcaoEscolhida = 2
        botaoEscolherOutlet.isHidden = false
    }
    
    
    @IBAction func opcao3Action(_ sender: UIButton) {
        resetaCorBotoes()
        opcao3botao.backgroundColor = .systemYellow
        opcaoEscolhida = 3
        botaoEscolherOutlet.isHidden = false
    }
    
    
    @IBAction func opcao4Action(_ sender: UIButton) {
        resetaCorBotoes()
        opcao4botao.backgroundColor = .systemYellow
        opcaoEscolhida = 4
        botaoEscolherOutlet.isHidden = false
    }
    
    
    @IBAction func botaoEscolher(_ sender: UIButton) {
        
        switch count {
            
        case 0:
            dragaoTexto.text = "Vamos lá! Sabe, humano, no seu mundo existem muitas representações da nossa espécie na cultura pop. Sabendo disso, me diga qual das opções a baixo NÃO se refera à um dragão:"
            escolherNomesOpcoes(opcao1: "Spyro", opcao2: "Smaug", opcao3: "Muchu", opcao4: "Barney")
            mostrarBotoes()
            count += 1
            botaoEscolherOutlet.isHidden = true
            botaoEscolherOutlet.setTitle("Confirmar escolha", for: .normal)
            
            
        case 1:
            if opcaoEscolhida == 4 {
                dragaoTexto.text = "Precisamente! Para a próxima terás que ter uma noção sobre tamanhos."
                esconderBotoes()
                resetaCorBotoes()
                count += 1
                botaoEscolherOutlet.isHidden = false
                botaoEscolherOutlet.setTitle("Próxima pergunta", for: .normal)
                
                
            } else {
                dragaoTexto.text = "Bom, sendo assim, não prosseguirá. Qualquer um que ache que Barney, o dinossauro, é um dragão certamente não está apto a avançar."
                botaoPerdeu.isHidden = false
                esconderBotoes()
                botaoEscolherOutlet.isHidden = true
                botaoPerdeu.setTitle("Voltar", for: .normal)
            }
            
            
        case 2:
            dragaoTexto.text = "Pois bem, qual dos seguintes é o maior dragão em termos de tamanho (cabeça até calda):"
            escolherNomesOpcoes(opcao1: "Viserion", opcao2: "Aurelion Sol", opcao3: "Smaug", opcao4: "Saphira")
            resetaCorBotoes()
            mostrarBotoes()
            count += 1
            botaoEscolherOutlet.isHidden = true
            botaoEscolherOutlet.setTitle("Confirmar resposta", for: .normal)
        
        
        case 3:
            if opcaoEscolhida == 2 {
                dragaoTexto.text = "Correto! Agora uma última pergunta, esta mais voltada para nossa mitologia: "
                esconderBotoes()
                count += 1
                botaoEscolherOutlet.isHidden = false
                botaoEscolherOutlet.setTitle("Próxima pergunta", for: .normal)
                
                
            } else {
                dragaoTexto.text = "Errado! O dragão Aurelion Sol tem tamanho cosmológico, ao contrário dos demais."
                botaoPerdeu.isHidden = false
                esconderBotoes()
                botaoEscolherOutlet.isHidden = true
                
            }
            
            
        case 4:
            
            dragaoTexto.text = "Dragões possuem representações na mitologia de diversas culturas. Para qual das seguintes origens a figura do dragão foi primeiramente associada à proteção de grandes tesouros"
            escolherNomesOpcoes(opcao1: "Persa", opcao2: "Chinesa", opcao3: "Japonesa", opcao4: "Nórdica")
            resetaCorBotoes()
            mostrarBotoes()
            count += 1
            botaoEscolherOutlet.isHidden = true
            botaoEscolherOutlet.setTitle("Confirmar resposta", for: .normal)
            
            
        case 5:
            if opcaoEscolhida == 1 {
                dragaoTexto.text = "Hora, humano! Você mostrou ser um ser inferior superior. Que bom que sabes algo sobre nós! Agora de um fora daqui antes que eu me irrite."
                esconderBotoes()
                count += 1
                botaoEscolherOutlet.isHidden = true
                botaoProximaFase.isHidden = false
                
                
            } else {
                dragaoTexto.text = "Incorreto, a origem da lenda do dragão guardião de tesouros, que é tema de muitas histórias hoje, se no oriente médio, mais ou menos onde era a antiga Persia"
                botaoPerdeu.isHidden = true
                esconderBotoes()
                botaoEscolherOutlet.isHidden = true
                
            }
            
            
        default:
            // não é para acontcer de entrar aqui
            print("lol")
        
        }
    }
    

    
    func esconderBotoes() {
        opcao1botao.isHidden = true
        opcao2botao.isHidden = true
        opcao3botao.isHidden = true
        opcao4botao.isHidden = true
    }
    
    func mostrarBotoes() {
        opcao1botao.isHidden = false
        opcao2botao.isHidden = false
        opcao3botao.isHidden = false
        opcao4botao.isHidden = false
    }
    
    //seta as opções dos botões alterando o título
    func escolherNomesOpcoes(opcao1: String, opcao2: String, opcao3: String, opcao4: String) {
        
        opcao1botao.setTitle(opcao1, for: .normal)
        opcao2botao.setTitle(opcao2, for: .normal)
        opcao3botao.setTitle(opcao3, for: .normal)
        opcao4botao.setTitle(opcao4, for: .normal)
        
    }
    
    //coloca a cor de fundo de todos os botões em branco
    func resetaCorBotoes() {
        opcao1botao.backgroundColor = .white
        opcao2botao.backgroundColor = .white
        opcao3botao.backgroundColor = .white
        opcao4botao.backgroundColor = .white
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
