//
//  Model.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 16/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import Foundation


class Model {
    static let instance = Model()
    private init(){
        
    }
    var fase:Fase = .inicio
    var nome:String = ""
}
