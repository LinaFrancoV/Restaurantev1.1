//
//  ContentView.swift
//  Restaurante_
//
//  Created by Lina Franco Vega on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*Pedir orden al cliente
Cobrar orden y restar del DailyBalance
Agregar la orden al dailyOrders
Enviar el mensaje de todo el proceso*/

//CRITERIOS DE ACEPTACION
/*Corregir el algoritmo usando el principio de Single Responsibility
 Toda función debe recibir algo y regresar algo mas
 Toda función solo debe encargarse de un proceso
 Cada función debe trabajar sin dependencias de otras
 Buenas practicas en nombrar variables y funciones*/

class DailyRestaurantControl {
    let dishPrice: Double = 20.0
    let controlDailyBalance: Double = 600.0
    var dailyOrders: [String]
    var dailyBalance: Double
    let dishName: String

    init(dailyOrders: [String], dailyBalance: Double, dishName: String) {
        self.dailyOrders = dailyOrders
        self.dailyBalance = dailyBalance
        self.dishName = dishName
    }
    func askCustomerForOrder (dishName: String) -> String {
        
        if dailyBalance <= controlDailyBalance {
            dailyOrders.append(dishName)
            return "Su orden esta en proceso..."
        } else {
            return "No se pudo procesar la orden debido a saldo insuficiente."
        }
    }
    
    func processOrder (dishName: String, dishPrice: Double) -> String {
        if dailyBalance <= controlDailyBalance {
            dailyBalance += dishPrice
            return "Orden procesada exitosamente. Su orden es \(dishName) por \(dishPrice)."
        } else {
            return "No se pudo procesar la orden debido a saldo insuficiente."
        }
    }

    func returnMessage() {
        if dailyBalance <= controlDailyBalance {
            print("Orden procesada: \(dishName)\n Precio total: \(dishPrice)\n Saldo restante: \(dailyBalance)")
        } else {
            print("Orden no procesada\n Saldo insuficiente: \(dailyBalance)")
        }
    }
}

let mondayRestaurantControl = DailyRestaurantControl(dailyOrders: [], dailyBalance: 500.0, dishName: "Hamburguesa")
//error expression are not allowed at the top level
mondayRestaurantControl.returnMessage()



