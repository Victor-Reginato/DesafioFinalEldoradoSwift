//
//  PerdeuViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 14/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit

class PerdeuViewController: UIViewController {
    
    @IBOutlet weak var perdeuLabel: UILabel!
    
    @IBOutlet weak var perdeuImagem: UIImageView!
    
    var fase = Model.instance.fase
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       switch fase {
       case .cleo:
            perdeuLabel.text = "Cleo te enganou"
       case .dragao:
            perdeuLabel.text = "Você foi queimado!"
       case .bruxa:
            perdeuLabel.text = "Você foi subtraido pelo bruxa"
       case .alien:
            perdeuLabel.text = "Glenn te jogou no espaço"
       case .inicio:
            perdeuLabel.text = "Mensagem de derrota"
        // Do any additional setup after loading the view.
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
}
