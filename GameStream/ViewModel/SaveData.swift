//
//  SaveData.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 20/09/21.
//

import Foundation

class SaveData{
    var correo: String = ""
    var contrasenia: String = ""
    var nombre: String = ""
    
    
    func guardarDatos(correo:String, contrasenia: String, nombre:String) -> Bool{
        
        print("Dentro de la funcion guardar datos obtuve \(correo) + \(contrasenia) + \(nombre)")
        
        UserDefaults.standard.set([correo, contrasenia, nombre], forKey: "datosUsuario")
        
        return true
    }
    
    
    func recuperarDatos() -> [String]{
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en el metodo recuperarDatos y recupere \(datosUsuario)")
        
        return datosUsuario
    }
    
    func validar(correo: String, contrasenia: String) -> Bool {
        var correoGuardado = ""
        var contraseniaGuardado = ""
        
        print("Revisando si tengo datos defaults en el corrreo \(correo) y la contraseña \(contrasenia)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contraseniaGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("el correo es \(correoGuardado) y contraseña \(contraseniaGuardado)")
            
            if(correo == correoGuardado && contrasenia == contraseniaGuardado){
                return true
            }else{
                return false
            }

        }else{
            print("No hay datos de usuario guardados en el user defauls")
            return false
        }
        
    }
}
