//
//  CocktailMakerViewController.swift
//  cocktailMaker
//
//  Created by Claudia Contreras on 3/26/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class CocktailMakerViewController: UIViewController {
    
    // MARK: - Properties
    private let cocktailResultController = CocktailResultController()
    var cocktailResults: CocktailResults?
    var drinks: DrinksResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground3Colors(colorOne: Colors.mainBlue, colorTwo: .black, colorThree: Colors.mainBlue)
        
        //getCocktail()
    }
    
    //MARK: - IBActions
    @IBAction func searchByNameTapped(_ sender: Any) {
        
    }
    @IBAction func searchByIngredientTapped(_ sender: Any) {
    }
    @IBAction func listAllDrinksByLetterTapped(_ sender: Any) {
    }
    @IBAction func randomCocktailTapped(_ sender: Any) {
        getCocktail()
    }
    
    // MARK: - Functions
    func getCocktail() {
        cocktailResultController.getRandomCocktail { (result) in
            do {
                let cocktail = try result.get()
                DispatchQueue.main.async {
                    self.cocktailResults = cocktail.drinks[0]
                }
            } catch {
                print(result)
            }
        }
    }
    
    // MARK: - Navigation

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "showDetailSegue", let detailVC = segue.destination as? DetailCocktailViewController {
               //dependency injection
               detailVC.cocktailResult = cocktailResults
           } else if segue.identifier == "searchByNameSegue", let tableVC = segue.destination as? CocktailTableViewController {
        }
       }

}
