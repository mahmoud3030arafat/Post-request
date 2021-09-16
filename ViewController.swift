

import UIKit
struct Post: Codable {
    let userId: String
    let title: String
    let body: String
    let id : Int
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


       
  

        // create a URLRequest by passing in the URL
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        // set the HTTP method to POST
        request.httpMethod = "POST"
      
      
        // set the appropriate HTTP header fields
        let parameters  = ["userId" : "1231231", "title" : "mahmoud.com" , "body" : "body" ] as [String : Any]
       do {
             request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
         } catch let error {
             print(error.localizedDescription)
         }
      
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
     
       
        // task for making the request
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            print(String(data: data!, encoding: .utf8) as Any)
            // also not necessary in a real app
            do{
                let decodedData = try JSONDecoder().decode(Post.self, from: data!)
                print(decodedData.userId)
                
            }catch let error {
                print(error)
            }
        }
        task.resume()
       
    }


}

