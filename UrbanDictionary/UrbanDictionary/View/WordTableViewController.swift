//
//  WordTableViewController.swift
//  UrbanDictionary
//
//  Created by Saulo Garcia on 9/19/20.
//

import UIKit

class WordTableViewController: UITableViewController {

    var words = [Word]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWords()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "WordItemTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WordItemTableViewCell  else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
        
        // Fetches the appropriate meal for the data source layout.
        let word = words[indexPath.row]
        cell.descriptionOutlet.text = word.definition
        cell.thumbsUp.text = String(word.thumbs_up)
        cell.thumbsDown.text = String(word.thumbs_down)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }

    private func loadWords() {
        let word1 = Word(definition: "In this lesson, you learned how to push scenes onto the navigation stack, and how to present views modally. You learned how to navigate back to a previous scene using segue unwinding, how to pass data across segues, and how to dismiss modal views.", thumbs_up: 10, thumbs_down: 1)
        let word2 = Word(definition: "Checkpoint: Run your app. Now when you click the Add button (+) and click Cancel instead of Save, you should navigate back to the meal list without adding a new meal.", thumbs_up: 7, thumbs_down: 6)
        let word3 = Word(definition: "The dismiss(animated:completion:) method dismisses the modal scene and animates the transition back to the previous scene (in this case, the meal list). The app does not store any data when the meal detail scene is dismissed, and neither the prepare(for:sender:) method nor the unwind action method are called.", thumbs_up: 2, thumbs_down: 10)
        words += [word1, word2, word3]
    }
    
}
