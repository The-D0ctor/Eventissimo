//
//  Tasks.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct TaskApp: Identifiable {
    let id: UUID = UUID()
    
    var title: String
    var description: String?
    var isCompleted: Bool = false
    var isUrgent: Bool = false
    var personsAssigned: [Person]

}

let tasks: [TaskApp] = [
    TaskApp(title: "Aller chercher le gâteau",
            description: "rendez-vous prévu à 13H15",
            isUrgent: true,
            personsAssigned: users),
    
    TaskApp(title: "Gonfler les ballons",
            isCompleted: true,
            personsAssigned: users),
    
    TaskApp(title: "Préparer la liste des invités",
            description: "Se concerter avec Emma",
            isUrgent: true,
            personsAssigned: users),
    
    TaskApp(title: "Réserver un lieu",
            personsAssigned: users),
    
    TaskApp(title: "Acheter un cadeau",
            description: "Chercher chez Sephora",
            isUrgent: true,
            personsAssigned: users),
    
    TaskApp(title: "Organiser le repas",
            description: "Mettre en place un budget",
            personsAssigned: users),
    
    TaskApp(title: "Prévoir les décorations",
            isUrgent: true,
            personsAssigned: users),
        
    TaskApp(title: "Préparer les objets à vendre",
            description: "Faire le tri dans la cave",
            personsAssigned: users),
    TaskApp(title: "Appeler Camille l'installation",
            description: "Si pas dispo, voir avec Thomas",
            personsAssigned: users),
    
    TaskApp(title: "Réserver l'emplacement du stand",
            description: "Auprès de la mairie",
            personsAssigned: users),
    
    TaskApp(title: "Organiser un feu de joie",
            description: "Sécuriser la zone",
            isUrgent: true,
            personsAssigned: users),
    
    TaskApp(title: "Prévoir un repas collectif",
            description: " Répartir les dépenses",
            personsAssigned: users),
    
    TaskApp(title: "Ajouter les participants à la liste",
            personsAssigned: users)
]
