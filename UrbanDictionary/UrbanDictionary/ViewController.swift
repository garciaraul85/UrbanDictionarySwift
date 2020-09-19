//
//  ViewController.swift
//  UrbanDictionary
//
//  Created by Saulo Garcia on 9/18/20.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let client = APIClient.shared
        // since it's an Observable, we just simply subscribe to it.
        do {
            try client.fetchTerm(term: "Pokemon")
                .subscribe(onNext: { result in
                  if let posts = result.value {
                    // iterate all posts.
                    posts.list.forEach {word in
                        print("definition: \(word.definition), up: \(word.thumbs_up), down: \(word.thumbs_down)")
                        print("//////////////////////////")
                    }
                  } else if let error = result.error {
                    print("code: \(String(describing: error.errorCode)), detail: \(String(describing: error.errorDetail))")
                  }
                })
                .disposed(by: disposeBag)
              // Do any additional setup after loading the view, typically from a nib.
        } catch {
            print("Error info: \(error)")
        }
    }


}

